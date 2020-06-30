import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:boolu/screens/home/leagues.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final today = DateFormat('d MMMM yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    // final Function wp = Screen(MediaQuery.of(context).size).wp;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Matches For You Today',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24.0,
                  color: Color.fromRGBO(166, 146, 50, 1.0),
                  fontFamily: 'FuturaHeavy',
                  fontWeight: FontWeight.w900),
            ),
          ),
          Text(
            today,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'FuturaLight',
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => League())),
            child: Container(
              width: double.infinity,
              child: Image(
                image: AssetImage(
                  'assets/images/premier_league.png',
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => League())),
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              child: Image(
                image: AssetImage(
                  'assets/images/laliga.png',
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => League())),
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              child: Image(
                image: AssetImage(
                  'assets/images/ucl.png',
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => League())),
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              child: Image(
                image: AssetImage(
                  'assets/images/serie_a.png',
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => League())),
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              child: Image(
                image: AssetImage(
                  'assets/images/bundesliga.png',
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => League())),
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              child: Image(
                image: AssetImage(
                  'assets/images/ligue_1.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
