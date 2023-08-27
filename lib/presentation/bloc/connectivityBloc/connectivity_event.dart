import 'package:connectivity/connectivity.dart';

abstract class ConnectivityEvent {}

class ConnectivityAvailableEvent extends ConnectivityEvent {}

class ConnectivityUnavailableEvent extends ConnectivityEvent {

  final ConnectivityResult result;

  ConnectivityUnavailableEvent(this.result);
}