import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madhur_app/core/utill/Validations.dart';
import 'package:madhur_app/data/model/UserResponse.dart';

import '../../../domain/usecases/AuthenticateUser.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticateUser authenticateUser;

  AuthenticationBloc({required this.authenticateUser})
      : super(AuthenticationInitial()) {
    on<TextChangeEvent>((event, emit) => {
          if (event.emailValue == "" && !isValidEmail(event.emailValue))
            {emit(AuthenticationFailure("Please enter a valid email"))}
          else if (event.passwordValue.length < 6)
            {emit(AuthenticationFailure("Please enter a valid password"))}
          else
            {emit(AuthenticationValid())}
        });

    on<LoginButtonPressed>((event, emit) async {
      // Call the authentication repository using AuthenticateUser
      emit(AuthenticationLoading());
      final authResult = await authenticateUser.callLogin(event.email, event.password);

      // Check the result and emit the corresponding state
      authResult.fold(
            (error) => emit(AuthenticationFailure(error.toString())),
            (userResponse) => emit(AuthenticationSuccess(userResponse)),
      );
    });
  }
}
