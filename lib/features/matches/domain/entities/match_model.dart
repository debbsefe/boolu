import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MatchesModel extends Equatable {
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
  final String homeLineUp;
  final String awayLineUp;
  final List goalScorers, card, stats;
  final dynamic subs, lineups;

  MatchesModel({
    this.awayLineUp,
    this.homeLineUp,
    this.goalScorers,
    this.card,
    this.stats,
    this.subs,
    this.lineups,
    this.competitionLogo,
    this.homeLogo,
    this.awayLogo,
    this.homescore,
    this.awayscore,
    this.competitionName,
    this.home,
    this.away,
    this.venue,
    this.matchTime,
  });

  @override
  List<Object> get props => [
        homeLineUp,
        awayLineUp,
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
