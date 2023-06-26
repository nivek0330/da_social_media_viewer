import 'package:da_social_media_viewer/core_packages.dart';
import 'package:da_social_media_viewer/user_interface/styles/styles.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  static AppStyle get style => _style;
  static AppStyle _style = AppStyle();

  const AppScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    _style = AppStyle(screenSize: context.sizePx);
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          SafeArea(
            top: false,
            bottom: false,
            child: Container(
              child: child,
            ),
          )
        ],
      ),
    );
  }
}
