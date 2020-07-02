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
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bg-premier.png'))),
                child: Card(
                  color: Color.fromRGBO(50, 97, 115, 0.8),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color.fromRGBO(50, 97, 115, 0.9),
                      ),
                      borderRadius: BorderRadius.circular(25.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.asset('assets/images/premierlogo.png'),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Text(
                          'Premier League',
                          style: TextStyle(
                            color: Color.fromRGBO(246, 246, 249, 1),
                            fontFamily: 'FuturaHeavy',
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
