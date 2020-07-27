import 'package:boolu/model/api.dart';
import 'package:boolu/screens/home/video.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class League extends StatefulWidget {
  final List<Sport> sport;
  final String category;
  League({this.sport, this.category});

  @override
  _LeagueState createState() => _LeagueState();
}

class _LeagueState extends State<League> {
  List<Sport> data = [];
  @override
  void initState() {
    super.initState();
    data = filterSport(widget.category);
  }

  dynamic filterSport(category) {
    var sport = widget.sport
        .where(
          (element) => element.competition.name == category,
        )
        .toList();
    return sport;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color.fromRGBO(245, 246, 249, 1.0),
          title: Text(
            'Leagues',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          Video(video: data[index].videos))),
                              child: Image(
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                                image: NetworkImage(data[index].thumbnail),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: <Widget>[
                              Text(
                                data[index].title,
                                style: TextStyle(
                                  fontFamily: 'FuturaHeavy',
                                ),
                              ),
                              Text(
                                data[index].date,
                                style: TextStyle(
                                  fontFamily: 'FuturaLight',
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ]),
                );
              }),
        ));
  }
}

//TODO:CUSTOMIZEAPPBAR
