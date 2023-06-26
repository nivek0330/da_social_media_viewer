import 'package:da_social_media_viewer/core_packages.dart';

class StyledAppBar extends StatelessWidget {
  final String title;
  final bool isMobile;

  const StyledAppBar({super.key, required this.title, required this.isMobile});

  //TODO: Add settings for mobile
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: double.infinity,
      child: AppBar(
        titleSpacing: $styles.insets.lg,
        backgroundColor: $styles.colors.background,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          title,
          style: $styles.text.h1
              .copyWith(fontSize: 30, fontWeight: FontWeight.w700),
        ),
        centerTitle: false,
      ),
    );
  }
}
