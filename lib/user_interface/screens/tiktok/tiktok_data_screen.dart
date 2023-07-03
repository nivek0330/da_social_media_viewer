import 'package:da_social_media_viewer/core_packages.dart';

class TikTokDataScreen extends StatefulWidget {
  final String tikTokCode;

  const TikTokDataScreen({super.key, required this.tikTokCode});

  @override
  State<TikTokDataScreen> createState() => _TikTokDataScreenState();
}

class _TikTokDataScreenState extends State<TikTokDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $styles.insets.lg),
      child: Column(),
    );
  }
}
