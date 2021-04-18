import 'package:Boolu/features/highlights/domain/entities/highlight_model.dart';

// ignore: must_be_immutable
class ScorebatHighlightModel extends HighLightModel {
  String title;
  String embed;
  String url;
  String thumbnail;
  String date;
  Side1 side1;
  Side1 side2;
  Competition competition;
  List<Videos> videos;
  List<VideoUrl> videourl;
  String team1;
  String team2;

  ScorebatHighlightModel(
      {this.title,
      this.embed,
      this.url,
      this.thumbnail,
      this.date,
      this.side1,
      this.side2,
      this.competition,
      this.videourl,
      this.videos,
      this.team1,
      this.team2})
      : super(
            date: date,
            team1: side1.name,
            team2: side2.name,
            thumbnail: thumbnail,
            videourl: videourl);

  ScorebatHighlightModel.fromJson(Map<String, dynamic> json) {
    if (json['videos'] != null) {
      videourl = List<VideoUrl>.from(
          json["videos"].map((x) => VideoUrl(url: x['embed'])));
    }
    team1 = json['side1']['name'];
    team2 = json['side2']['name'];

    title = json['title'];
    embed = json['embed'];
    url = json['url'];
    thumbnail = json['thumbnail'];
    date = json["date"];
    side1 = json['side1'] != null ? new Side1.fromJson(json['side1']) : null;
    side2 = json['side2'] != null ? new Side1.fromJson(json['side2']) : null;
    competition = json['competition'] != null
        ? new Competition.fromJson(json['competition'])
        : null;
    if (json['videos'] != null) {
      videos = new List<Videos>();
      json['videos'].forEach((v) {
        videos.add(new Videos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['embed'] = this.embed;
    data['url'] = this.url;
    data['thumbnail'] = this.thumbnail;
    data['date'] = this.date;
    if (this.side1 != null) {
      data['side1'] = this.side1.toJson();
    }
    if (this.side2 != null) {
      data['side2'] = this.side2.toJson();
    }
    if (this.competition != null) {
      data['competition'] = this.competition.toJson();
    }
    if (this.videos != null) {
      data['videos'] = this.videos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Side1 {
  String name;
  String url;

  Side1({this.name, this.url});

  Side1.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Competition {
  String name;
  int id;
  String url;

  Competition({this.name, this.id, this.url});

  Competition.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}

class Videos {
  String title;
  String embed;

  Videos({this.title, this.embed});

  Videos.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    embed = json['embed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['embed'] = this.embed;
    return data;
  }
}
