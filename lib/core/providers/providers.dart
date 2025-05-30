import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_pomodoro/core/config/env.dart';

/// env provider
final envProvider = Provider<EnvConfig>((ref) {
  return EnvConfig.dev; // or EnvConfig.dev based on your needs
});
