import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MatchesModel extends Equatable {
  final String competitionName;
  final List<String> matches;
  MatchesModel({
    @required this.competitionName,
    @required this.matches,
  });

  @override
  List<Object> get props => [competitionName, matches];
}

class Matches {}
