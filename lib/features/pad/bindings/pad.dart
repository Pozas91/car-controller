import 'package:car_controller/features/pad/controllers/pad.dart';
import 'package:get/get.dart';

class PadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PadController());
  }
}