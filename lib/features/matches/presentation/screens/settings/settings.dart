import 'package:Boolu/core/utils/strings.dart';
import 'package:Boolu/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:Boolu/core/utils/font_constants.dart';
import 'package:Boolu/core/utils/size_config.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'about_boolu.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double width = SizeConfig.blockSizeHorizontal;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(30, 20, 0, 5),
            child: Text(
              'Settings',
              style: CustomTheme.bodyText.copyWith(
                  fontSize: width * font16,
                  color: Colors.white.withOpacity(0.85)),
            ),
          ),
          const Divider(
            color: Colors.white,
          ),
          Height(20),
          CustomListTile(
            onTap: () {
              share();
            },
            icon: Icons.share,
            title: 'Tell a friend',
          ),
          CustomListTile(
            icon: Icons.thumb_up,
            title: 'Rate Us',
          ),
          CustomListTile(
            image: 'assets/images/info_2.png',
            title: 'About Boolu',
            onTap: () {
              Get.to(() => AboutBoolu());
            },
          ),
        ],
      ),
    );
  }
}

void share() async {
  final String text =
      "'Click the link below to enjoy football highlights and livescores \nhttps://boolu.page.link/XktS";
  final String subject = boolu;

  Share.share(text, subject: subject);
}

class CustomListTile extends StatelessWidget {
  final String title, image;

  final IconData icon;

  final VoidCallback onTap;

  const CustomListTile(
      {Key key, @required this.title, this.icon, this.image, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double width = SizeConfig.blockSizeHorizontal;
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10),
      child: ListTile(
          onTap: onTap,
          leading: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white)),
              padding: image == null
                  ? const EdgeInsets.all(8)
                  : const EdgeInsets.all(16),
              child: image == null
                  ? Icon(
                      icon,
                      color: Colors.white,
                    )
                  : Image.asset(image, height: 15)),
          title: Text(
            title,
            style: CustomTheme.bodyText.copyWith(fontSize: width * font14),
          )),
    );
  }
}
