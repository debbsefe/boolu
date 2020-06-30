import 'package:boolu/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:boolu/screens/authenticate/onboarding.dart';
import 'package:boolu/screens/home/home.dart';


class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

 
 Widget build(BuildContext context) {

   final user = Provider.of<User>(context);

   if(user == null){
     return Onboarding();
   }else{
     return Home();
   }
 }
}