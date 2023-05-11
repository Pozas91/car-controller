import 'package:car_controller/routing/routes.dart';
import 'package:get/get.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BLEController extends GetxController {
  static BLEController get to => Get.find();

  // Get bluetooth service
  FlutterBluePlus ble = FlutterBluePlus.instance;

  final _devices = <BluetoothDevice>[].obs;
  final _name = "".obs;
  final _type = "".obs;
  final _id = "".obs;
  late BluetoothDevice? _device;

  get devices => _devices;
  get name => _name.value;
  get type => _type.value;
  get id => _id.value;

  @override
  void onInit() {
    super.onInit();
    searchDevices();
  }

  searchDevices() {
    // Start scanning
    ble.startScan(timeout: const Duration(seconds: 4));

    // Listen to scan results
    var subscription = ble.scanResults.listen((results) {

      // Clean previous devices
      _devices.clear();

      // Filter devices with unknown type
      var devicesFiltered = results
          .where((r) => r.device.type != BluetoothDeviceType.unknown)
          .map((r) => r.device)
          .toList();

      // Add all devices
      _devices.addAll(devicesFiltered);
    });

    // Stop scanning
    ble.stopScan();
  }

  device(int index) {
    return _devices[index].name;
  }

  info(int index) {
    var device = _devices[index];
    _name.value = device.name;
    _id.value = device.id.id;
    _type.value = device.type.name;
    _device = device;
  }

  connect() async {
    if(_device != null) {
      await _device
          ?.connect(timeout: const Duration(seconds: 10), autoConnect: false)
          .then((void value) {
            Get.toNamed(Routes.pad.v, arguments: {'device': _device});
          });
    }
  }
}
