import 'package:go_router/go_router.dart';
import 'package:k_pomodoro/features/poromodo/presentation/pages/home_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) {
        return const MyHomePage(title: 'Home');
      }, 
    ),
  ],
);
