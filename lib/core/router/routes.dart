enum Routes {
  home,
  login,
  signUp,
  forgotPassword,
  splash
  ;

  String get path => '/${name.toLowerCase()}';
}
