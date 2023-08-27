


abstract class AuthenticationEvent {}


class TextChangeEvent extends AuthenticationEvent{
  final String emailValue;
  final String passwordValue;

  TextChangeEvent({required this.emailValue, required this.passwordValue});
}

class LoginButtonPressed extends AuthenticationEvent {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});
}