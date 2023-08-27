import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madhur_app/presentation/bloc/connectivityBloc/connectivity_event.dart';
import 'package:madhur_app/presentation/bloc/connectivityBloc/connectivity_state.dart';

// BLoC
class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
      StreamSubscription? subcription;
  final Connectivity _connectivity=Connectivity();


  ConnectivityBloc() : super(ConnectivityInitialState()) {
    on<ConnectivityAvailableEvent>(
        (event, emit) => emit(ConnectivityAvailableState()));
    on<ConnectivityUnavailableEvent>(
        (event, emit) => emit(ConnectivityUnAvailableState()));


    subcription=  _connectivity.onConnectivityChanged.listen((event) {
      if(event==ConnectivityResult.mobile|| event==ConnectivityResult.wifi){
        add(ConnectivityAvailableEvent());
      }else{
        add(ConnectivityUnavailableEvent(event));
      }

    });
  }

  @override
  Future<void> close() {
    subcription?.cancel();
    return super.close();
  }


}
