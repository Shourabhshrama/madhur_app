import 'package:madhur_app/data/model/ResetPassResponse.dart';

abstract class ResetPassState {}

class ResetPassInitialState extends ResetPassState {}

class ResetPassValidState extends ResetPassState {}

class ResetPassLoadingState extends ResetPassState {}

class ResetPassSuccessState extends ResetPassState {
  final ResetPassResponse response;

  ResetPassSuccessState(this.response);
}

class ResetPassFailureState extends ResetPassState {
  final String error;

  ResetPassFailureState(this.error);
}
