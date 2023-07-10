import 'package:da_social_media_viewer/business_logic/utils/device_info.dart';
import 'package:da_social_media_viewer/core_packages.dart';
import 'package:da_social_media_viewer/user_interface/screens/home/home_navi_bar.dart';

class HomeScreen extends StatefulWidget {
  final Widget child;

  const HomeScreen({super.key, required this.child});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith('/instagram')) {
      _currentIndex = 1;
      return 1;
    }
    if (location.startsWith('/tiktok')) {
      _currentIndex = 2;
      return 2;
    }
    if (location.startsWith('/')) {
      _currentIndex = 0;
      return 0;
    }
    return 0;
  }

  void _onNavTapped(int index, BuildContext context) {
    _currentIndex = index;

    switch (index) {
      case 0:
        appRouter.go('/');
        break;
      case 1:
        appRouter.go('/instagram');
        break;
      case 2:
        appRouter.go('/tiktok');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double getNavBarWidth() {
      if (DeviceScreen.isPhone(context)) {
        return 0;
      } else if (DeviceScreen.isTablet(context)) {
        return 200;
      } else if (DeviceScreen.isMonitor(context)) {
        return 300;
      } else {
        return 300;
      }
    }

    String getAppBarTitle() {
      if (_currentIndex == 0) return 'Dashboard';
      if (_currentIndex == 1) return 'Instagram';
      if (_currentIndex == 2) return 'TikTok';

      return 'Dashboard';
    }

    return Row(
      children: [
        HomeNavigationBar(
          width: getNavBarWidth(),
          index: _calculateSelectedIndex,
          onTap: _onNavTapped,
          currentIndex: _currentIndex,
        ),
        Expanded(
          child: Column(
            children: [
              StyledAppBar(
                  title: getAppBarTitle(), isMobile: getNavBarWidth() == 0),
              Expanded(
                child: Container(
                  color: Color.fromRGBO(135, 206, 235, .1),
                  child: Padding(
                    padding: EdgeInsets.all(
                      $styles.insets.md,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular($styles.insets.sm),
                        color: $styles.colors.background,
                      ),
                      child: widget.child,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
