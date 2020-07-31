import 'dart:convert';

LiveScores liveScoresFromJson(String str) =>
    LiveScores.fromJson(json.decode(str));

String liveScoresToJson(LiveScores data) => json.encode(data.toJson());

class LiveScores {
  LiveScores({
    this.filters,
    this.competition,
    this.season,
    this.standings,
  });

  Filters filters;
  Competition competition;
  Season season;
  List<Standing> standings;

  factory LiveScores.fromJson(Map<String, dynamic> json) => LiveScores(
        filters: Filters.fromJson(json["filters"]),
        competition: Competition.fromJson(json["competition"]),
        season: Season.fromJson(json["season"]),
        standings: List<Standing>.from(
            json["standings"].map((x) => Standing.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "filters": filters.toJson(),
        "competition": competition.toJson(),
        "season": season.toJson(),
        "standings": List<dynamic>.from(standings.map((x) => x.toJson())),
      };
}

class Competition {
  Competition({
    this.id,
    this.area,
    this.name,
    this.code,
    this.plan,
    this.lastUpdated,
  });

  int id;
  Area area;
  String name;
  String code;
  String plan;
  DateTime lastUpdated;

  factory Competition.fromJson(Map<String, dynamic> json) => Competition(
        id: json["id"],
        area: Area.fromJson(json["area"]),
        name: json["name"],
        code: json["code"],
        plan: json["plan"],
        lastUpdated: DateTime.parse(json["lastUpdated"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "area": area.toJson(),
        "name": name,
        "code": code,
        "plan": plan,
        "lastUpdated": lastUpdated.toIso8601String(),
      };
}

class Area {
  Area({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Filters {
  Filters();

  factory Filters.fromJson(Map<String, dynamic> json) => Filters();

  Map<String, dynamic> toJson() => {};
}

class Season {
  Season({
    this.id,
    this.startDate,
    this.endDate,
    this.currentMatchday,
    this.winner,
  });

  int id;
  DateTime startDate;
  DateTime endDate;
  int currentMatchday;
  dynamic winner;

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        id: json["id"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        currentMatchday: json["currentMatchday"],
        winner: json["winner"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "startDate":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "endDate":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "currentMatchday": currentMatchday,
        "winner": winner,
      };
}

class Standing {
  Standing({
    this.stage,
    this.type,
    this.group,
    this.table,
  });

  String stage;
  String type;
  dynamic group;
  List<Table> table;

  factory Standing.fromJson(Map<String, dynamic> json) => Standing(
        stage: json["stage"],
        type: json["type"],
        group: json["group"],
        table: List<Table>.from(json["table"].map((x) => Table.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "stage": stage,
        "type": type,
        "group": group,
        "table": List<dynamic>.from(table.map((x) => x.toJson())),
      };
}

class Table {
  Table({
    this.position,
    this.team,
    this.playedGames,
    this.won,
    this.draw,
    this.lost,
    this.points,
    this.goalsFor,
    this.goalsAgainst,
    this.goalDifference,
  });

  int position;
  Team team;
  int playedGames;
  int won;
  int draw;
  int lost;
  int points;
  int goalsFor;
  int goalsAgainst;
  int goalDifference;

  factory Table.fromJson(Map<String, dynamic> json) => Table(
        position: json["position"],
        team: Team.fromJson(json["team"]),
        playedGames: json["playedGames"],
        won: json["won"],
        draw: json["draw"],
        lost: json["lost"],
        points: json["points"],
        goalsFor: json["goalsFor"],
        goalsAgainst: json["goalsAgainst"],
        goalDifference: json["goalDifference"],
      );

  Map<String, dynamic> toJson() => {
        "position": position,
        "team": team.toJson(),
        "playedGames": playedGames,
        "won": won,
        "draw": draw,
        "lost": lost,
        "points": points,
        "goalsFor": goalsFor,
        "goalsAgainst": goalsAgainst,
        "goalDifference": goalDifference,
      };
}

class Team {
  Team({
    this.id,
    this.name,
    this.crestUrl,
  });

  int id;
  String name;
  String crestUrl;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        crestUrl: json["crestUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "crestUrl": crestUrl,
      };
}
