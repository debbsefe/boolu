import 'package:boolu/model/api.dart';
import 'package:boolu/screens/home/video.dart';
import 'package:boolu/screens/shared/appcolors.dart';
import 'package:boolu/screens/shared/fontFamily.dart';
import 'package:boolu/screens/shared/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class League extends StatefulWidget {
  final List<Sport> sport;
  final String category;
  League({this.sport, this.category});

  @override
  _LeagueState createState() => _LeagueState();
}

class _LeagueState extends State<League> {
  List<Sport> data = [];
  @override
  void initState() {
    super.initState();
    data = filterSport(widget.category) ?? [];
  }

  dynamic filterSport(category) {
    var sport = widget.sport
        .where(
          (element) => element.competition.name == category,
        )
        .toList();
    return sport;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Leagues',
            style: TextStyle(
                color: Colors.black,
                fontFamily: FontFamily.futuraMedium,
                fontSize: SizeConfig.safeBlockHorizontal * FontSize.font18),
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: SizeConfig.safeBlockVertical * 2),
              Text(
                widget.category,
                style: TextStyle(
                    fontFamily: FontFamily.futuraHeavy,
                    fontSize: SizeConfig.safeBlockHorizontal * FontSize.font24,
                    color: Appcolors.TextHeading),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 5),
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        DateTime parseDate = DateTime.parse(data[index].date);
                        String dateFormat =
                            DateFormat('d MMMM yyyy').format(parseDate);

                        return data.isEmpty
                            ? Text(
                                'No matches today',
                                style: TextStyle(
                                    fontFamily: FontFamily.futuraHeavy,
                                    color: Colors.black),
                              )
                            : Padding(
                                padding: EdgeInsets.all(
                                    SizeConfig.safeBlockHorizontal * 2),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(
                                            SizeConfig.safeBlockHorizontal * 2),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              SizeConfig.safeBlockHorizontal *
                                                  6),
                                          child: GestureDetector(
                                            onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) => Video(
                                                        video: data[index]
                                                            .videos))),
                                            child: Image(
                                              height: SizeConfig
                                                      .safeBlockHorizontal *
                                                  24,
                                              width: SizeConfig
                                                      .safeBlockHorizontal *
                                                  24,
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  data[index].thumbnail),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                              SizeConfig.safeBlockHorizontal *
                                                  2),
                                          child: Column(children: <Widget>[
                                            Text(
                                              data[index].title,
                                              style: TextStyle(
                                                fontFamily: 'FuturaHeavy',
                                              ),
                                            ),
                                            Text(
                                              dateFormat,
                                              style: TextStyle(
                                                fontFamily: 'FuturaLight',
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ),
                                    ]),
                              );
                      }),
                ),
              ),
            ],
          ),
        ));
  }
}
