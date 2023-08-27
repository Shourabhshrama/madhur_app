import 'package:madhur_app/data/model/CountryResponse.dart';

import '../../../data/model/StateResponse.dart';

abstract class StateState {}

class InitialState extends StateState {}

class StateSelectedState extends StateState {
  final StateModel selectedState;

  StateSelectedState({required this.selectedState});
}

class LocationLoading extends StateState {}
class LocationLoadingFailed extends StateState {
  final String error;
  LocationLoadingFailed({required this.error});
}

class LocationLoaded extends StateState {
  final StateResponse response;
  LocationLoaded({required this.response});
}