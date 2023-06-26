import 'package:da_social_media_viewer/core_packages.dart';

class StyledCircularProgressBar extends StatelessWidget {
  const StyledCircularProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: $styles.colors.primary),
    );
  }
}
