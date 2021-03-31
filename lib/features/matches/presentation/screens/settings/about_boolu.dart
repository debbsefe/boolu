import 'package:Boolu/core/utils/size_config.dart';
import 'package:Boolu/core/utils/theme.dart';
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
          Container(
            margin: const EdgeInsets.fromLTRB(10, 20, 0, 5),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.white)),
                Text(
                  'About Bọọlu',
                  style: CustomTheme.bodyText.copyWith(
                      fontSize: width * font16,
                      color: Colors.white.withOpacity(0.85)),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.white,
          ),
        ],
      )),
    );
  }
}
