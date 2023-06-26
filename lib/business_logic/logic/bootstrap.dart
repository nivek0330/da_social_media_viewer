import 'package:da_social_media_viewer/business_logic/utils/device_info.dart';
import 'package:da_social_media_viewer/core_packages.dart';
import 'package:flutter/services.dart';

class Bootstrap {
  bool isBootstrapComplete = false;

  bool get isLandscapeEnable =>
      DevicePlatform.isDesktopOrWeb || deviceSize.shortestSide > 500;

  Axis? get supportedOrientations => isLandscapeEnable ? null : Axis.vertical;

  Size get deviceSize {
    final w = WidgetsBinding.instance.platformDispatcher.views.first;
    return w.physicalSize / w.devicePixelRatio;
  }

  Future<void> init() async {
    setDeviceOrientation(supportedOrientations);

    isBootstrapComplete = true;
  }

  void setDeviceOrientation(Axis? axis) {
    final orientations = <DeviceOrientation>[];
    if (axis == null || axis == Axis.vertical) {
      orientations.addAll(
        [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ],
      );
    }

    if (axis == null || axis == Axis.horizontal) {
      orientations.addAll([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }

    SystemChrome.setPreferredOrientations(orientations);
  }
}
