import 'package:boolu/model/api.dart';
import 'package:boolu/screens/home/video.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class League extends StatefulWidget {
  @override
  _LeagueState createState() => _LeagueState();
}

class _LeagueState extends State<League> {
  Future<List<Sport>> sport;
  // response.body.toString().split("src=")[1].split(" frameborder")[0]
  @override
  void initState() {
    super.initState();
    sport = _fetchJobs();
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
        body: FutureBuilder<List<Sport>>(
            future: sport,
            builder: (context, snapshot) {
              List<Sport> sports = snapshot.data;
              if (!snapshot.hasData) {
                return Text('No matches today', textAlign: TextAlign.center);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                    itemCount: sports.length,
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
                                            builder: (_) => Video(
                                                video: sports[index].videos))),
                                    child: Image(
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.cover,
                                      image:
                                          NetworkImage(sports[index].thumbnail),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(children: <Widget>[
                                    Text(
                                      sports[index].title,
                                      style: TextStyle(
                                        fontFamily: 'FuturaHeavy',
                                      ),
                                    ),
                                    Text(
                                      sports[index].date,
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
              );
            }));
  }

  Future<List<Sport>> _fetchJobs() async {
    final jobsListAPIUrl = 'https://www.scorebat.com/video-api/v1/';
    final response = await get(jobsListAPIUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new Sport.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }
}

//TODO:CUSTOMIZEAPPBAR
