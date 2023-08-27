abstract class ResetPasswordEvent {}


class ResetPassTextChangeEvent extends ResetPasswordEvent{
  final String emailValue;


  ResetPassTextChangeEvent({required this.emailValue});
}

class ResetButtonPressed extends ResetPasswordEvent {
  final String email;


  ResetButtonPressed({required this.email});
}