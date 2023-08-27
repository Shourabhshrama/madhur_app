import 'package:madhur_app/data/model/GeneralResponse.dart';

abstract class ChangePassState {}

class ChangePassInitialState extends ChangePassState {}

class ChangePassLoadingState extends ChangePassState {}
class ChangePassValidState extends ChangePassState {}

class ChangePassSuccessState extends ChangePassState {
  final GeneralResponse response;

  ChangePassSuccessState(this.response);
}

class ChangePassErrorState extends ChangePassState {
  final String error;

  ChangePassErrorState(this.error);
}
