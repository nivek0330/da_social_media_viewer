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
              builder: (context, state) => Center(child: Text('Hello World!')),
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
