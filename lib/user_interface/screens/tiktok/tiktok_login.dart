import 'package:cached_network_image/cached_network_image.dart';
import 'package:da_social_media_viewer/core_packages.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TikTokLogin extends StatelessWidget {
  const TikTokLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $styles.insets.lg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CachedNetworkImage(imageUrl: '/assets/logos/tiktok_logo.png'),
          StyledElevatedButton(
              text: 'Login to TikTok', onPressed: () => tiktok.tikTokLogin()),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'By clicking Submit, you agree to our ',
                  style: $styles.text.bodySmall,
                ),
                TextSpan(
                    text: 'Terms and Conditions',
                    style: $styles.text.bodySmallBold
                        .copyWith(color: $styles.colors.primary),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => launchUrlString(
                          'https://www.ivyusa.com/member/agreement.html')),
                TextSpan(
                  text: ' and ',
                  style: $styles.text.bodySmall,
                ),
                TextSpan(
                    text: 'Privacy Policy',
                    style: $styles.text.bodySmallBold
                        .copyWith(color: $styles.colors.primary),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => launchUrlString(
                          'https://www.ivyusa.com/member/privacy.html'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
