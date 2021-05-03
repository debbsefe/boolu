import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MatchesModel extends Equatable {
  final String competitionName,
      competitionLogo,
      home,
      away,
      homescore,
      awayscore,
      homeLogo,
      awayLogo,
      venue,
      matchTime,
      homeLineUp,
      awayLineUp;
  final List<GoalScorers> goalScorers;
  final List<Cards> cardelement;
  final List<Statistics> stats;
  final List<Subtitutes> homeSubtitutes,
      awaySubtitutes,
      homecoach,
      awaycoach,
      lineupHome,
      lineupAway;

  MatchesModel({
    this.lineupAway,
    this.lineupHome,
    this.homecoach,
    this.awaycoach,
    this.cardelement,
    this.awayLineUp,
    this.goalScorers,
    this.homeLineUp,
    this.stats,
    this.homeSubtitutes,
    this.awaySubtitutes,
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
        lineupAway,
        lineupHome,
        homecoach,
        awaycoach,
        cardelement,
        awayLineUp,
        goalScorers,
        homeLineUp,
        stats,
        homeSubtitutes,
        awaySubtitutes,
        competitionLogo,
        homeLogo,
        awayLogo,
        homescore,
        awayscore,
        competitionName,
        home,
        away,
        venue,
        matchTime,
      ];
}

class GoalScorers extends Equatable {
  final String homeScorer,
      homeAssist,
      awayAssist,
      awayScorer,
      scores,
      time,
      homeFault,
      card,
      awayFault;

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

  @override
  List<Object> get props => [
        homeScorer,
        homeAssist,
        awayAssist,
        awayScorer,
        scores,
        time,
        homeFault,
        card,
        awayFault,
      ];
}

class Cards extends GoalScorers {
  Cards({
    this.time,
    this.homeFault,
    this.card,
    this.awayFault,
  }) : super(
            homeFault: homeFault, time: time, card: card, awayFault: awayFault);

  final String time, homeFault, card, awayFault;
}

class Statistics extends Equatable {
  Statistics({
    @required this.type,
    @required this.home,
    @required this.away,
  });

  final String type, home, away;

  @override
  List<Object> get props => [
        type,
        home,
        away,
      ];
}

class Subtitutes extends Equatable {
  Subtitutes({
    @required this.lineupPlayer,
    @required this.lineupNumber,
    this.lineupPosition,
  });

  final String lineupPlayer, lineupNumber, lineupPosition;

  @override
  List<Object> get props => [
        lineupPlayer,
        lineupNumber,
        lineupPosition,
      ];
}
