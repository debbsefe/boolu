part of 'matches_bloc.dart';

abstract class MatchesEvent extends Equatable {
  const MatchesEvent();

  @override
  List<Object> get props => [];
}

class GetMatches extends MatchesEvent {
  final String competionId, dateFrom, dateTo;

  GetMatches({this.competionId, this.dateFrom, this.dateTo});
}
