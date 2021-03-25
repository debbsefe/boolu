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
  final List<GoalScorers> homescorer;
  final List<Cards> cardelement;
  final List<Statistics> stats;
  final Map<String, dynamic> lineups;

  MatchesModel({
    this.cardelement,
    this.awayLineUp,
    this.homescorer,
    this.homeLineUp,
    this.stats,
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

class GoalScorers {
  final String homeScorer;
  final String homeAssist;
  final String awayAssist;
  final String awayScorer;
  final String scores;
  final String time;
  final String homeFault;
  final String card;
  final String awayFault;

  GoalScorers({
    this.homeScorer,
    this.homeAssist,
    this.awayAssist,
    this.awayScorer,
    this.scores,
    this.time,
    this.homeFault,
    this.card,
    this.awayFault,
  });
}

class Cards extends GoalScorers {
  Cards({
    this.time,
    this.homeFault,
    this.card,
    this.awayFault,
  }) : super(
            homeFault: homeFault, time: time, card: card, awayFault: awayFault);

  final String time;
  final String homeFault;
  final String card;
  final String awayFault;
}

class Statistics {
  Statistics({
    @required this.type,
    @required this.home,
    @required this.away,
  });

  final String type;
  final String home;
  final String away;
}
