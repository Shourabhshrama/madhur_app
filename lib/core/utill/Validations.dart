bool isValidEmail(String email) {
  // Use a regular expression to validate email format
  // This regex is a basic one, you can use a more advanced one for better validation
  // final RegExp emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  // print('VALIDATION');
  // print(emailRegExp.hasMatch(email));
  // return emailRegExp.hasMatch(email);

  if (email.contains("@")) {
    return true;
  } else {
    return false;
  }
}
