
import 'package:madhur_app/data/model/StateResponse.dart';

abstract class StateEvent {}

class StateSelectedEvent extends StateEvent {
  final StateModel selectedState;

  StateSelectedEvent(this.selectedState);
}

class LoadAllStatesEvent extends StateEvent {}