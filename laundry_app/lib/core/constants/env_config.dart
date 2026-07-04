import 'package:envied/envied.dart';

part 'env_config.g.dart';

@Envied(path: '.env.dev')
abstract class EnvConfig {
  @EnviedField(varName: 'BASE_API_URL')
  static const String baseApiUrl = _EnvConfig.baseApiUrl;

  @EnviedField(varName: 'GOOGLE_WEB_CLIENT_ID')
  static const String googleWebClientId = _EnvConfig.googleWebClientId;
}
