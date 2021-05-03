import 'package:Boolu/core/utils/size_config.dart';
import 'package:Boolu/core/utils/theme.dart';
import 'package:Boolu/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:Boolu/core/utils/font_constants.dart';
import 'package:get/get.dart';

class AboutBoolu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double width = SizeConfig.blockSizeHorizontal;
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 20, 0, 5),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back, color: Colors.white)),
                  Text(
                    'About $boolu',
                    style: CustomTheme.bodyText.copyWith(
                        fontSize: width * font16,
                        color: Colors.white.withOpacity(0.85)),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.white,
          ),
          Spacer(flex: 3),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    '$boolu'.toLowerCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: width * font48,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Height(30),
                Center(
                  child: Text(
                    'App version : 1',
                    style:
                        CustomTheme.bodyText.copyWith(fontSize: width * font14),
                  ),
                ),
                Height(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/twitter.png', height: 60),
                    Width(20),
                    Image.asset('assets/images/facebook.png', height: 60),
                    Width(20),
                    Image.asset('assets/images/instagram.png', height: 60),
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
