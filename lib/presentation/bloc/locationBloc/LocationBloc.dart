import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madhur_app/data/model/StateResponse.dart';

import 'package:madhur_app/domain/usecases/location_usecase.dart';
import 'package:madhur_app/presentation/bloc/locationBloc/LocationEvent.dart';
import 'package:madhur_app/presentation/bloc/locationBloc/LocationState.dart';

import '../../../domain/usecases/imp/location_usecase_imp.dart';

class StateBloc extends Bloc<StateEvent, StateState> {
  final LocationUseCase useCase;
  StateModel selectedState = StateModel(
      id: '',
      name: '',
      countryId: '',
      createdAt: '',
      updatedAt: '',
      v: 0); // Add this property
  StateBloc({required this.useCase}) : super(InitialState()) {
      if (useCase == null) {
          throw Exception('useCase not initialized');
      }
  }

  @override
  Stream<StateState> mapEventToState(StateEvent event) async* {
    if (event is StateSelectedEvent) {
      selectedState = event.selectedState;
      yield StateSelectedState(selectedState: event.selectedState);
    } else if (event is LoadAllStatesEvent) {
      yield LocationLoading(); // Emit loading state

      final result = await useCase.getAllState();

      result.fold(
        (error) => emit(LocationLoadingFailed(error: error.toString())),
        // Emit error state
        (response) =>
            emit(LocationLoaded(response: response)), // Emit loaded state
      );
    }
  }
}
