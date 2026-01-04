import 'package:envied/envied.dart';
import 'package:injectable/injectable.dart';

part 'gen/env.g.dart';

@injectable
@Envied(path: 'env/.env.prod', name: 'Prod')
@Envied(path: 'env/.env.staging', name: 'Staging')
@Envied(path: 'env/.env.dev', name: 'Dev')
final class Env {
  factory Env() => _instance;

  static final Env _instance = switch (EnvEnum.fromString(const String.fromEnvironment('FLAVOR'))) {
    EnvEnum.prod => _Prod(),
    EnvEnum.staging => _Staging(),
    EnvEnum.dev => _Dev(),
  };

  @EnviedField(varName: 'BASE_URL', obfuscate: true)
  final String baseUrl = _instance.baseUrl;

  @EnviedField(varName: 'KEY_TOKEN', obfuscate: true)
  final String keyToken = _instance.keyToken;
}

enum EnvEnum {
  prod,
  staging,
  dev
  ;

  static EnvEnum fromString(String value) => value == 'prod'
      ? EnvEnum.prod
      : value == 'staging'
      ? EnvEnum.staging
      : EnvEnum.dev;
}
