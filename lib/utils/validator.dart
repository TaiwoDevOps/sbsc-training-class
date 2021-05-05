class Validator {
//email validator method
  String validateEmail(String email) {
    bool emailRegExp = RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);

    if (emailRegExp)
      return null;
    else
      return "Incorrect email";
  }

  //password validator method
  String validatePassword(String password) {
    if (password.length >= 11)
      return null;
    else
      return "Password is weak";
  }
}
