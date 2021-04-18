part of 'highlight_bloc.dart';

abstract class HighlightEvent extends Equatable {
  const HighlightEvent();

  @override
  List<Object> get props => [];
}

class GetHighlight extends HighlightEvent {}
