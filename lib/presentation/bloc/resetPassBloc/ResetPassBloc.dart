import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madhur_app/core/utill/Validations.dart';
import 'package:madhur_app/data/model/ResetPassResponse.dart';
import 'package:madhur_app/presentation/bloc/resetPassBloc/ResetPassEvent.dart';
import 'package:madhur_app/presentation/bloc/resetPassBloc/ResetPassState.dart';

import '../../../domain/usecases/AuthenticateUser.dart';

class ResetPassWordBloc extends Bloc<ResetPasswordEvent, ResetPassState> {
  final AuthenticateUser authenticateUser;

  ResetPassWordBloc({required this.authenticateUser})
      : super(ResetPassInitialState()) {
    on<ResetPassTextChangeEvent>((event, emit) => {
          if (event.emailValue.isEmpty && !isValidEmail(event.emailValue) )
            {emit(ResetPassFailureState("Please enter a valid email"))}
          else
            {emit(ResetPassValidState())}
        });
    on<ResetButtonPressed>((event, emit) async {
      emit(ResetPassLoadingState());

      final result = await authenticateUser.callResetPass(event.email);

      result.fold((error) => emit(ResetPassFailureState(error.toString())),
          (response) => emit(ResetPassSuccessState(response)));
    });
  }
}
