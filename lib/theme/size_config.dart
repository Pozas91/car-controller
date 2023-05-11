import 'package:get/get.dart';

class SizeConfig {
  static double get screenWidth {
    return Get.width;
  }

  static double get screenHeight {
    return Get.height;
  }

  static double get devicePixelRatio {
    return Get.mediaQuery.devicePixelRatio;
  }

  // Block Size Horizontal
  static double get bH {
    return screenWidth / 100;
  }

  // Block Size Vertical
  static double get bV {
    return screenHeight / 100;
  }
}
