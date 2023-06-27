import 'package:da_social_media_viewer/business_logic/utils/loading_state_mixin.dart';
import 'package:da_social_media_viewer/core_packages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:url_launcher/url_launcher_string.dart';

class InstagramLogin extends StatefulWidget {
  const InstagramLogin({super.key});

  @override
  State<InstagramLogin> createState() => _InstagramLoginState();
}

class _InstagramLoginState extends State<InstagramLogin>
    with LoadingStateMixin {
  String _errorText = '';
  String get errorText => _errorText;
  set errorText(String errorText) => setState(() => _errorText = errorText);

  void _handleSubmitPressed() async {
    String result = await instagram.instagramLogin();
    errorText = FacebookAuth.i.isWebSdkInitialized.toString();
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $styles.insets.lg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          VSpace.sm,
          Image.asset(
            'assets/logos/instagram_logo.png',
            height: 150,
          ),
          isLoading
              ? StyledCircularProgressBar()
              : StyledElevatedButton(
                  text: 'Login to Instagram',
                  onPressed: () => _handleSubmitPressed()),
          if (_errorText.isNotEmpty) ...[
            Text(errorText,
                style: $styles.text.body
                    .copyWith(color: $styles.colors.secondary)),
          ],
          VSpace.xs,
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
