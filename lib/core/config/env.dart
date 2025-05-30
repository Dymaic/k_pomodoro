import 'package:freezed_annotation/freezed_annotation.dart';

part 'env.freezed.dart';

@freezed
abstract class EnvConfig with _$EnvConfig {
  const factory EnvConfig({
    required String appName,
    required String apiBaseUrl,
    required bool isDebug,
  }) = _EnvConfig;

  static EnvConfig get dev => EnvConfig(
        appName: 'KPomodoro Dev',
        apiBaseUrl: 'https://dev.api.kpomodoro.com',
        isDebug: true,
      );

  static EnvConfig get prod => EnvConfig(
        appName: 'KPomodoro',
        apiBaseUrl: 'https://api.kpomodoro.com',
        isDebug: false,
      );

  static EnvConfig get current {  
    // You can implement logic to determine the current environment
    // For example, based on a build flavor or environment variable
    // Here we default to dev for demonstration purposes
    return EnvConfig.dev; 
  }
}
