import 'package:Boolu/features/highlights/domain/entities/highlight_model.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class HighlightVideo extends StatefulWidget {
  final String video;
  HighlightVideo(this.video);
  @override
  _HighlightVideoState createState() => _HighlightVideoState();
}

class _HighlightVideoState extends State<HighlightVideo> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebView(
          initialUrl: getVideoUrl(),
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ),
    );
  }

  getVideoUrl() {
    var item = widget.video;
    var test = item.split("src=")[1].split("frameborder")[0];
    String url = test.substring(1, test.length - 2);
    print('url $url stop');
    return url;
  }
}
