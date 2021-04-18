part of 'highlight_bloc.dart';

abstract class HighLightState extends Equatable {
  const HighLightState();

  @override
  List<Object> get props => [];
}

class HighLightInitial extends HighLightState {}

class HighLightLoading extends HighLightState {}

class HighLightLoaded extends HighLightState {
  final List<HighLightModel> highLightModel;

  HighLightLoaded(this.highLightModel);
}

class HighLightError extends HighLightState {
  final String message;

  HighLightError(this.message);

  @override
  List<Object> get props => [message];
}
