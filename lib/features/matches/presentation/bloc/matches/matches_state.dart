part of 'matches_bloc.dart';

abstract class MatchesState extends Equatable {
  const MatchesState();

  @override
  List<Object> get props => [];
}

class MatchesInitial extends MatchesState {}

class MatchesLoading extends MatchesState {}

class MatchesLoaded extends MatchesState {
  final List<MatchesModel> matchesModel;

  MatchesLoaded(this.matchesModel);
}

class MatchesError extends MatchesState {
  final String message;

  MatchesError(this.message);

  @override
  List<Object> get props => [message];
}
