import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class DynamicLinks {
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
