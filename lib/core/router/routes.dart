enum Routes {
  home,
  login,
  signUp,
  forgotPassword,
  otp,
  splash
  ;

  String get path => '/${name.toLowerCase()}';
}
