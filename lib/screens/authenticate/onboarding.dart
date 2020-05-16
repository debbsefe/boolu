import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(229, 229, 229, 1.0),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
               decoration : BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'images/footballplayer.png'
                  ),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}