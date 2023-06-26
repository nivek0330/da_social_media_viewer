import 'package:da_social_media_viewer/core_packages.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeNavigationBar extends StatelessWidget {
  final double width;
  final Function(int) onTap;
  final int index;

  const HomeNavigationBar(
      {super.key,
      required this.width,
      required this.onTap,
      required this.index});

  @override
  Widget build(BuildContext context) {
    bool isMonitor = width == 300;
    String header = isMonitor ? 'Data Viewer' : 'DAV';

    return Container(
      height: double.infinity,
      width: width,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.only(bottomRight: Radius.circular($styles.insets.sm)),
        color: $styles.colors.background,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
        child: Column(
          children: [
            VSpace.xl,
            VSpace.xs,
            Container(
              color: $styles.colors.primary,
              child: Padding(
                padding: EdgeInsets.all($styles.insets.xs),
                child: Center(
                  child: Text(
                    header,
                    style: $styles.text.h3
                        .copyWith(color: $styles.colors.background),
                    maxLines: 1,
                  ),
                ),
              ),
            ),
            VSpace.xl,
            AnimatedDrawerText(
                isSelected: index == 0,
                text: 'Dashboard',
                icon: FontAwesomeIcons.house,
                isMonitor: isMonitor,
                onSelected: () => onTap(0)),
            VSpace.lg,
            AnimatedDrawerText(
                isSelected: index == 1,
                text: 'Instagram',
                icon: FontAwesomeIcons.instagram,
                isMonitor: isMonitor,
                onSelected: () => onTap(1)),
            VSpace.lg,
            AnimatedDrawerText(
                isSelected: index == 2,
                text: 'TikTok',
                icon: FontAwesomeIcons.tiktok,
                isMonitor: isMonitor,
                onSelected: () => onTap(2)),
          ],
        ),
      ),
    );
  }
}

class AnimatedDrawerText extends StatelessWidget {
  final bool isSelected;
  final String text;
  final VoidCallback onSelected;
  final IconData icon;
  final bool isMonitor;

  const AnimatedDrawerText(
      {super.key,
      required this.isSelected,
      required this.text,
      required this.onSelected,
      required this.icon,
      required this.isMonitor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $styles.insets.lg),
      child: AnimatedContainer(
        duration: $styles.times.fast,
        width: double.infinity,
        color: isSelected ? $styles.colors.secondary : Colors.transparent,
        child: Padding(
          padding: EdgeInsets.all($styles.insets.xs),
          child: GestureDetector(
            onTap: () => onSelected(),
            child: Row(
              mainAxisAlignment: isMonitor
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                Icon(icon,
                    color: isSelected
                        ? $styles.colors.background
                        : Colors.black.withOpacity(.5)),
                isMonitor ? HSpace.sm : Container(),
                isMonitor
                    ? Text(text,
                        style: $styles.text.h4.copyWith(
                            color: isSelected
                                ? $styles.colors.background
                                : Colors.black.withOpacity(.5)))
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
