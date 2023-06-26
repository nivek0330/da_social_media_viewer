import 'package:da_social_media_viewer/core_packages.dart';
import 'package:da_social_media_viewer/user_interface/app_scaffold.dart';
import 'package:da_social_media_viewer/user_interface/screens/home/home_screen.dart';

final appRouter = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => AppScaffold(child: child),
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: HomeScreen(),
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                FadeTransition(
              opacity: CurveTween(curve: Curves.easeIn).animate(animation),
              child: child,
            ),
          ),
        ),
      ],
    ),
  ],
);
