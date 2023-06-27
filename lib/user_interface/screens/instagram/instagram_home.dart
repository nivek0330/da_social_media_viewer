import 'dart:math';

import 'package:da_social_media_viewer/business_logic/logic/app_model.dart';
import 'package:da_social_media_viewer/core_packages.dart';
import 'package:da_social_media_viewer/user_interface/screens/instagram/instagram_login.dart';

class InstagramHome extends StatefulWidget with GetItStatefulWidgetMixin {
  InstagramHome({super.key});

  @override
  State<InstagramHome> createState() => _InstagramHomeState();
}

class _InstagramHomeState extends State<InstagramHome> with GetItStateMixin {
  @override
  Widget build(BuildContext context) {
    bool login = watchX((AppModel m) => m.instagramLogin);
    bool isSmallScreen = context.widthPx < 700;

    /// Calculate the height/width of form.
    double formWidth = max(400, context.widthPx * .25);
    double formHeight = max(650, context.heightPx * .5);
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          fit: isSmallScreen ? FlexFit.tight : FlexFit.loose,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: $styles.insets.lg, vertical: $styles.insets.lg),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular($styles.insets.sm),
                color: isSmallScreen ? null : $styles.colors.background,
                boxShadow: [
                  /// Show an isolated container with shadow on large screen -- like Lyft
                  isSmallScreen
                      ? BoxShadow(
                          color: Colors.transparent,
                        )
                      : BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                ],
              ),
              width: formWidth,
              height: formHeight,
              child: AnimatedSwitcher(
                duration: $styles.times.fast,
                child: !login
                    ? InstagramLogin()
                    : Center(child: Text('Logged in!')),
              ),
            ),
          ),
        )
      ],
    );
  }
}
