import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:k_pomodoro/core/database/isar_database.dart';
import 'package:k_pomodoro/core/route/router.dart';
import 'package:k_pomodoro/features/pomodoro/domain/repositories/setting/setting_local_repo.dart';
import 'package:k_pomodoro/features/pomodoro/domain/services/settings_service.dart';
import 'package:k_skin/k_skin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  
  try {
    // 初始化设置仓库
    await SettingLocalRepo.getInstance().init();
    
    // 初始化 Isar 数据库
    await IsarDatabase.getInstance();
    
    // 初始化设置服务并确保默认设置
    final settingsService = SettingsService.getInstance();
    await settingsService.initializeSettings();
  } catch (e) {
    // 如果初始化失败，记录错误但继续启动应用
    debugPrint('Initialization error: $e');
  }

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('zh', 'CN')],
      path: "lib/assets/translations",
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: KThemeProvider(
        child: MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: KThemeManager.instance.currentTheme.toFlutterThemeData(),
          routerConfig: router,
        ),
      ),
    );
  }
}
