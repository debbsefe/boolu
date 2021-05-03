import 'package:Boolu/core/utils/font_constants.dart';
import 'package:Boolu/core/utils/size_config.dart';
import 'package:Boolu/core/utils/theme.dart';
import 'package:Boolu/features/highlights/domain/entities/highlight_model.dart';
import 'package:Boolu/features/highlights/presentation/blocs/highlight/highlight_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import 'highlight_video.dart';

class HighLight extends StatefulWidget {
  @override
  _HighLightState createState() => _HighLightState();
}

class _HighLightState extends State<HighLight> {
  @override
  void initState() {
    super.initState();
    final matchBloc = BlocProvider.of<HighlightBloc>(context, listen: false);

    matchBloc.add(GetHighlight());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeHorizontal;
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<HighlightBloc, HighLightState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is HighLightLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is HighLightError) {
              return Container(
                margin: const EdgeInsets.only(top: 50),
                child: Text(state.message,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * font12,
                    )),
              );
            } else if (state is HighLightLoaded) {
              final List<HighLightModel> highlight = state.highLightModel;

              return SingleChildScrollView(
                child: Column(
                  children: highlight.map((e) {
                    print('embed ${e.embedUrl}');

                    DateTime parseDate = DateTime.parse(e.date);
                    String dateFormat =
                        DateFormat('d MM yyyy').format(parseDate);
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => HighlightVideo(e.videourl));
                      },
                      child: BuildWidget(
                        date: dateFormat,
                        image: e.thumbnail,
                        title: e.team1 == null
                            ? ''
                            : e.team2 == null
                                ? ''
                                : e.team1 + ' vs ' + e.team2,
                      ),
                    );
                  }).toList(),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class BuildWidget extends StatelessWidget {
  final String image, date, title;

  const BuildWidget({Key key, this.image, this.date, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeHorizontal;
    List dateList = date.split(' ');
    String formattedDate = dateList.length > 2
        ? dateList[0] + '/' + dateList[1] + '/' + dateList[2]
        : date;
    return Row(
      children: [
        Expanded(
            child: Column(
          children: [
            Container(
                padding: EdgeInsets.zero,
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.white.withOpacity(0.85))),
                child: Image.network(
                  image,
                  width: 150,
                )),
          ],
        )),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                title,
                style: CustomTheme.bodyTextBold.copyWith(
                    fontSize: width * font12,
                    color: Colors.white.withOpacity(0.85)),
              ),
              Height(1.0.h),
              Text(
                'Click to watch this highlight',
                style: TextStyle(
                    fontSize: width * font10, color: CustomTheme.accent1),
              ),
              Height(2.0.h),
              Row(
                children: [
                  Image.asset('assets/images/date.png', height: 14),
                  Text(
                    formattedDate,
                    style: TextStyle(
                        fontSize: width * font10, color: CustomTheme.white),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
