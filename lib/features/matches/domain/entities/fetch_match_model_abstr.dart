import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MatchesModel extends Equatable {
  final String competitionName;
  final List<Match> matches;
  MatchesModel({
    @required this.competitionName,
    @required this.matches,
  });

  @override
  List<Object> get props => [competitionName, matches];
}

class Match {
  Match({
    this.id,
    this.utcDate,
    this.status,
    this.matchday,
    this.stage,
    this.group,
    this.lastUpdated,
    this.referees,
  });

  int id;
  DateTime utcDate;
  String status;
  int matchday;
  String stage;
  String group;
  DateTime lastUpdated;

  List<dynamic> referees;
}
