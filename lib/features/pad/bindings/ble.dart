import 'package:car_controller/features/pad/controllers/ble.dart';
import 'package:get/get.dart';

class BLEBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BLEController());
  }
}