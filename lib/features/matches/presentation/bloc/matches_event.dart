abstract class MatchesEvent {}

class GetMatches extends MatchesEvent {
  final String competionId, season, dateFrom, dateTo;

  GetMatches(this.competionId, this.season, this.dateFrom, this.dateTo);
}
