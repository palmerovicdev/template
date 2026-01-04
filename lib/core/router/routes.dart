enum Routes {
  home,
  login,
  signUp,
  splash
  ;

  String get path => '/${name.toLowerCase()}';
}
