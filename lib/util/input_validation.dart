class InputValidation {
  static bool isNameValid(String name) {
    // String pattern=r'[^!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]' ;
        String pattern=r'^[a-z A-Z,.\-]+$';

    RegExp regExp=RegExp(pattern);
    if (name.isEmpty) {
      return false;
    }
    else if(!regExp.hasMatch(name)){
      return false;
    }
    return true;
  }

  static bool isPasswordValid(String password) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (password.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(password)) {
      return false;
    }
    return true;
  }

  static bool isPhoneNoValid(String phoneNo) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

    RegExp regExp = RegExp(pattern);
    if (phoneNo.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(phoneNo)) {
      return false;
    }
    return true;
  }

  static bool isConfirmPassValid(String confirmPass) {
    if (confirmPass.isEmpty) {
      return false;
    }
    return true;
  }

  static bool isEmailValid(String email) {
  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp=RegExp(pattern);
    if (email.isEmpty) {
      return false; 
    } else if (!regExp.hasMatch(email)) {
      return false;
    }
    return true;
  }
}
