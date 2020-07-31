import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class DynamicLinks {
  Future<Uri> createDynamicLink(String uid) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://boolu.page.link',
      link: Uri.parse('https://boolung.com/referral?uid=$uid'),
      androidParameters: AndroidParameters(
        packageName: 'com.mamuseferha.boolu',
        minimumVersion: 0,
      ),
    );

    Uri url;
    final link = await parameters.buildUrl();
    final ShortDynamicLink shortenedLink =
        await DynamicLinkParameters.shortenUrl(
      link,
      DynamicLinkParametersOptions(
          shortDynamicLinkPathLength: ShortDynamicLinkPathLength.unguessable),
    );

    url = shortenedLink.shortUrl;
    Share.share(url.toString());
    return url;
  }

  void share(BuildContext context) async {
    final String text = "Referral Code";
    final String shares = 'Share';

    Share.share(text, subject: shares);

    return share(context);
  }

  Future fetchLinkData() async {
    final link = await FirebaseDynamicLinks.instance.getInitialLink();

    handleLinkData(link);
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      handleLinkData(dynamicLink);
    });
  }

  Future handleLinkData(PendingDynamicLinkData data) async {
    final Uri uri = data?.link;
    return uri;
  }
}
