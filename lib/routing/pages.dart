import 'package:car_controller/features/pad/bindings/ble.dart';
import 'package:car_controller/features/pad/bindings/pad.dart';
import 'package:car_controller/features/pad/screens/ble.dart';
import 'package:car_controller/features/pad/screens/pad.dart';
import 'package:car_controller/routing/routes.dart';
import 'package:get/get.dart';

pages() => [
  GetPage(
    name: Routes.pad.v,
    page: () => PadPage(title: 'Pad'.tr),
    binding: PadBinding(),
  ),
  GetPage(
    name: Routes.ble.v,
    page: () => BLEPage(title: 'BLE'.tr),
    binding: BLEBinding(),
  )
];
