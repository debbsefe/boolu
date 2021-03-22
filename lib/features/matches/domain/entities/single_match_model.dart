import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class SingleMatchModel extends Equatable {
  final String competitionName;
  final String competitionLogo;
  final String home;
  final String away;
  final String homescore;
  final String awayscore;
  final String homeLogo;
  final String awayLogo;
  final String venue;
  final String matchTime;

  SingleMatchModel({
    @required this.competitionLogo,
    @required this.homeLogo,
    @required this.awayLogo,
    @required this.homescore,
    @required this.awayscore,
    @required this.competitionName,
    @required this.home,
    @required this.away,
    @required this.venue,
    @required this.matchTime,
  });

  @override
  List<Object> get props => [
        competitionName,
        home,
        away,
        homescore,
        awayscore,
        competitionLogo,
        homeLogo,
        awayLogo,
        venue,
        matchTime,
      ];
}
