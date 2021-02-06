
class FetchMatchesModel {
    FetchMatchesModel({
        this.count,
        this.filters,
        this.competition,
        this.matches,
    });

    int count;
    Filters filters;
    Competition competition;
    List<Match> matches;

    factory FetchMatchesModel.fromJson(Map<String, dynamic> json) => FetchMatchesModel(
        count: json["count"],
        filters: Filters.fromJson(json["filters"]),
        competition: Competition.fromJson(json["competition"]),
        matches: List<Match>.from(json["matches"].map((x) => Match.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "filters": filters.toJson(),
        "competition": competition.toJson(),
        "matches": List<dynamic>.from(matches.map((x) => x.toJson())),
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

    factory Filters.fromJson(Map<String, dynamic> json) => Filters(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Match {
    Match({
        this.id,
        this.season,
        this.utcDate,
        this.status,
        this.matchday,
        this.stage,
        this.group,
        this.lastUpdated,
        this.odds,
        this.score,
        this.homeTeam,
        this.awayTeam,
        this.referees,
    });

    int id;
    Season season;
    DateTime utcDate;
    String status;
    int matchday;
    String stage;
    String group;
    DateTime lastUpdated;
    Odds odds;
    Score score;
    Area homeTeam;
    Area awayTeam;
    List<dynamic> referees;

    factory Match.fromJson(Map<String, dynamic> json) => Match(
        id: json["id"],
        season: Season.fromJson(json["season"]),
        utcDate: DateTime.parse(json["utcDate"]),
        status: json["status"],
        matchday: json["matchday"],
        stage: json["stage"],
        group: json["group"],
        lastUpdated: DateTime.parse(json["lastUpdated"]),
        odds: Odds.fromJson(json["odds"]),
        score: Score.fromJson(json["score"]),
        homeTeam: Area.fromJson(json["homeTeam"]),
        awayTeam: Area.fromJson(json["awayTeam"]),
        referees: List<dynamic>.from(json["referees"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "season": season.toJson(),
        "utcDate": utcDate.toIso8601String(),
        "status": status,
        "matchday": matchday,
        "stage": stage,
        "group": group,
        "lastUpdated": lastUpdated.toIso8601String(),
        "odds": odds.toJson(),
        "score": score.toJson(),
        "homeTeam": homeTeam.toJson(),
        "awayTeam": awayTeam.toJson(),
        "referees": List<dynamic>.from(referees.map((x) => x)),
    };
}

class Odds {
    Odds({
        this.msg,
    });

    String msg;

    factory Odds.fromJson(Map<String, dynamic> json) => Odds(
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
    };
}

class Score {
    Score({
        this.winner,
        this.duration,
        this.fullTime,
        this.halfTime,
        this.extraTime,
        this.penalties,
    });

    dynamic winner;
    String duration;
    ExtraTime fullTime;
    ExtraTime halfTime;
    ExtraTime extraTime;
    ExtraTime penalties;

    factory Score.fromJson(Map<String, dynamic> json) => Score(
        winner: json["winner"],
        duration: json["duration"],
        fullTime: ExtraTime.fromJson(json["fullTime"]),
        halfTime: ExtraTime.fromJson(json["halfTime"]),
        extraTime: ExtraTime.fromJson(json["extraTime"]),
        penalties: ExtraTime.fromJson(json["penalties"]),
    );

    Map<String, dynamic> toJson() => {
        "winner": winner,
        "duration": duration,
        "fullTime": fullTime.toJson(),
        "halfTime": halfTime.toJson(),
        "extraTime": extraTime.toJson(),
        "penalties": penalties.toJson(),
    };
}

class ExtraTime {
    ExtraTime({
        this.homeTeam,
        this.awayTeam,
    });

    dynamic homeTeam;
    dynamic awayTeam;

    factory ExtraTime.fromJson(Map<String, dynamic> json) => ExtraTime(
        homeTeam: json["homeTeam"],
        awayTeam: json["awayTeam"],
    );

    Map<String, dynamic> toJson() => {
        "homeTeam": homeTeam,
        "awayTeam": awayTeam,
    };
}

class Season {
    Season({
        this.id,
        this.startDate,
        this.endDate,
        this.currentMatchday,
    });

    int id;
    DateTime startDate;
    DateTime endDate;
    int currentMatchday;

    factory Season.fromJson(Map<String, dynamic> json) => Season(
        id: json["id"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        currentMatchday: json["currentMatchday"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "startDate": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "endDate": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "currentMatchday": currentMatchday,
    };
}
