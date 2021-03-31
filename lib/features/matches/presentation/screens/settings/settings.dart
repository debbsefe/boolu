import 'package:Boolu/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:Boolu/core/utils/font_constants.dart';
import 'package:Boolu/core/utils/size_config.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double width = SizeConfig.blockSizeHorizontal;
    return SafeArea(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: CustomTheme.bodyText.copyWith(
                  fontSize: width * font16,
                  color: Colors.white.withOpacity(0.85)),
            ),
            Divider(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
