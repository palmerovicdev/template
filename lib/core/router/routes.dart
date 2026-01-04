enum Routes {
  home,
  login,
  splash
  ;

  String get path => '/${name.toLowerCase()}';
}
