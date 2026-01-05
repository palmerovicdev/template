enum Routes {
  home,
  login,
  signUp,
  forgotPassword,
  otp,
  resetPassword,
  splash
  ;

  String get path => '/${name.toLowerCase()}';
}
