import 'dart:math';

import 'package:da_social_media_viewer/core_packages.dart';
import 'package:da_social_media_viewer/user_interface/screens/tiktok/tiktok_login.dart';

class TikTokHome extends StatefulWidget with GetItStatefulWidgetMixin {
  TikTokHome({super.key});

  @override
  State<TikTokHome> createState() => _TikTokHomeState();
}

class _TikTokHomeState extends State<TikTokHome> with GetItStateMixin {
  String? tikTokCode = '';
  String response = '';

  @override
  void initState() {
    super.initState();

    tikTokCode = Uri.base.queryParameters['code'];
    if (tikTokCode != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        getAccessToken();
      });
    }
  }

  void getAccessToken() async {
    String res = await tiktok.getAccessToken(tikTokCode!);

    setState(() {
      response = res;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                child: (tikTokCode == null)
                    ? TikTokLogin()
                    : Center(
                        child: Text('$tikTokCode $response'),
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
