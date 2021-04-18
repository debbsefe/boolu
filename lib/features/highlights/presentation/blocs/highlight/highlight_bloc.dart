import 'dart:async';
import 'package:Boolu/core/error/failures.dart';
import 'package:Boolu/core/usecases/usecase.dart';
import 'package:Boolu/features/highlights/domain/entities/highlight_model.dart';
import 'package:Boolu/features/highlights/domain/usecases/get_highlights.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'highlight_event.dart';
part 'highlight_state.dart';

const String SERVER_FAILURE_MESSAGE = 'No highlight available';
const String CACHE_FAILURE_MESSAGE =
    'No internet connection detected or no match found';

class HighlightBloc extends Bloc<HighlightEvent, HighLightState> {
  HighlightBloc({this.getHighLights}) : super(HighLightInitial());
  final GetHighLights getHighLights;
  @override
  Stream<HighLightState> mapEventToState(
    HighlightEvent event,
  ) async* {
    if (event is GetHighlight) {
      yield HighLightLoading();

      final _failureOrSuccess = await getHighLights(NoParams());
      yield* _eitherLoadedOrErrorState(_failureOrSuccess);
    }
  }

  Stream<HighLightState> _eitherLoadedOrErrorState(
    Either<Failure, List<HighLightModel>> failureOrSuccess,
  ) async* {
    yield failureOrSuccess.fold(
      (failure) => HighLightError(_mapFailureToMessage(failure)),
      (success) => HighLightLoaded(success),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
