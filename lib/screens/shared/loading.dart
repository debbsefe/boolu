import 'package:flutter/material.dart';
import 'package:boolu/screens/shared/size_config.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      color: Colors.white,
      height: SizeConfig.screenHeight,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.amber),
        ),
      ),
    );
  }
}
