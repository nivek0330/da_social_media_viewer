import 'package:da_social_media_viewer/business_logic/utils/device_info.dart';
import 'package:da_social_media_viewer/core_packages.dart';
import 'package:da_social_media_viewer/user_interface/screens/home/home_navi_bar.dart';
import 'package:da_social_media_viewer/user_interface/screens/tiktok/tiktok_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [
    Center(child: Text('Hello World!')),
    Center(child: Text('Instagram!')),
    TikTokHome(),
  ];

  int _currentIndex = 0;

  void changeTab(int value) {
    setState(() {
      _currentIndex = value;
    });
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
          index: _currentIndex,
          onTap: changeTab,
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
                          borderRadius:
                              BorderRadius.circular($styles.insets.sm),
                          color: $styles.colors.background,
                        ),
                        child: screens.elementAt(_currentIndex)),
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
