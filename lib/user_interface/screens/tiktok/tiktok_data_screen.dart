import 'package:da_social_media_viewer/core_packages.dart';

class TikTokDataScreen extends StatefulWidget {
  final String accessToken;

  const TikTokDataScreen({super.key, required this.accessToken});

  @override
  State<TikTokDataScreen> createState() => _TikTokDataScreenState();
}

class _TikTokDataScreenState extends State<TikTokDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all($styles.insets.sm),
      child: Center(
        child: Text(widget.accessToken),
      ),
    );
  }
}
