import 'package:Boolu/Models/fetchMatches.dart';
import 'package:equatable/equatable.dart';

abstract class MatchesState extends Equatable {
  @override
  List<Object> get props => [];
}

class MatchesInitial extends MatchesState {}

class MatchesLoading extends MatchesState {}

class MatchesLoaded extends MatchesState {
  final FetchMatches fetchMatches;

  MatchesLoaded(this.fetchMatches);
}

class MatchesError extends MatchesState {
  final error;
  MatchesError({this.error});
}
