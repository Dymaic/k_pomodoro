import 'package:go_router/go_router.dart';
import 'package:k_pomodoro/features/pomodoro/presentation/pages/home_page.dart';
import 'package:k_pomodoro/features/pomodoro/presentation/pages/setting_page.dart';
import 'package:k_pomodoro/features/pomodoro/presentation/pages/tasks/tasks_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) {
        return const HomePage();
      }, 
    ),
    GoRoute(
      path: "/settings",
      builder: (context, state) {
        return const SettingPage();
      },
    ),
    GoRoute(
      path: "/tasks",
      builder: (context, state) {
        return const TasksPage(); // Replace with your task list page
      },
    )
  ],
);
