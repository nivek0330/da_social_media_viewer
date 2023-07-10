import 'package:da_social_media_viewer/core_packages.dart';
import 'package:da_social_media_viewer/user_interface/app_scaffold.dart';
import 'package:da_social_media_viewer/user_interface/screens/home/home_screen.dart';
import 'package:da_social_media_viewer/user_interface/screens/instagram/instagram_home.dart';
import 'package:da_social_media_viewer/user_interface/screens/tiktok/tiktok_home.dart';

final appRouter = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => AppScaffold(child: child),
      routes: [
        ShellRoute(
          builder: (context, state, child) => HomeScreen(child: child),
          routes: [
            GoRoute(
              path: '/',
              pageBuilder: (context, state) => CustomTransitionPage(
                  child: Center(child: Text('Hello World!')),
                  transitionDuration: $styles.times.fast,
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    return FadeTransition(
                      opacity:
                          CurveTween(curve: Curves.easeIn).animate(animation),
                      child: child,
                    );
                  }),
            ),
            GoRoute(
              path: '/instagram',
              builder: (context, state) => InstagramHome(),
            ),
            GoRoute(
              path: '/tiktok',
              builder: (context, state) => TikTokHome(),
            ),
          ],
        ),
      ],
    ),
  ],
);
