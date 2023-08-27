import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madhur_app/data/model/GeneralResponse.dart';
import 'package:madhur_app/presentation/bloc/changePassBloc/ChangePassEvent.dart';
import 'package:madhur_app/presentation/bloc/changePassBloc/ChangePassState.dart';

import '../../../domain/usecases/AuthenticateUser.dart';

class ChangePassBloc extends Bloc<ChangePassEvent, ChangePassState> {
  final AuthenticateUser authenticateUser;

  ChangePassBloc({required this.authenticateUser}) : super(ChangePassInitialState()) {
    on<ChangePassWordTextChangeEvent>((event, emit) => {
          if (event.password.isEmpty)
            {emit(ChangePassErrorState("Please Enter Password"))}
          else if (event.rePassword.isEmpty)
            {emit(ChangePassErrorState("Please Confirm Password"))}
          else if (event.token.isEmpty)
            {emit(ChangePassErrorState("Please enter  Token"))}
          else
            {emit(ChangePassValidState())}
        });
    on<ChangePasswordSubmitButtonEvent>((event, emit) async {
      // Call the authentication repository using AuthenticateUser
      emit(ChangePassLoadingState());

      if (event.password != event.rePassword) {
        emit(ChangePassErrorState("Confirm password does not match"));
      }
      final authResult = await authenticateUser.callChangePass(
          event.id, event.token, event.rePassword);

      // Check the result and emit the corresponding state
      authResult.fold(
        (error) => emit(ChangePassErrorState(error.toString())),
        (userResponse) => emit(ChangePassSuccessState(userResponse)),
      );
    });
  }
}
