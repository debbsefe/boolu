import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class HighLightModel extends Equatable {
  final String thumbnail, team1, team2, date, embedUrl;
  final List<VideoUrl> videourl;
  HighLightModel(
      {@required this.embedUrl,
      @required this.videourl,
      @required this.thumbnail,
      @required this.team1,
      @required this.team2,
      @required this.date});
  @override
  List<Object> get props => [videourl, thumbnail, team1, team2, date, embedUrl];
}

class VideoUrl {
  VideoUrl({
    this.url,
  });

  final String url;
}
