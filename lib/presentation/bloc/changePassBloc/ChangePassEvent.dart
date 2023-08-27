abstract class ChangePassEvent {}

class ChangePassWordTextChangeEvent extends ChangePassEvent {
  final String password;
  final String rePassword;
  final String token;

  ChangePassWordTextChangeEvent(this.password, this.rePassword, this.token);
}

class ChangePasswordSubmitButtonEvent extends ChangePassEvent {
  final String id;
  final String password;
  final String rePassword;
  final String token;

  ChangePasswordSubmitButtonEvent(this.id,this.password, this.rePassword, this.token);
}
