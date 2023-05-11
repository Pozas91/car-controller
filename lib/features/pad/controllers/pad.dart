import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:get/get.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class PadController extends GetxController {
  static PadController get to => Get.find();

  // Get bluetooth service
  FlutterBluePlus ble = FlutterBluePlus.instance;

  late BluetoothDevice? _device;
  final _info = "".obs;
  final _x = (0.0).obs;
  final _y = (0.0).obs;

  get device => _device;
  get info => _info.value;
  get x => _x.value;
  get y => _y.value;

  @override
  void onReady() {
    super.onInit();

    _readBLEInfo();
  }

  _readBLEInfo() async {
    ble.turnOn().then((on)  {

      print("Inside");

      print(on);

      if(on) {
        ble.connectedDevices.then((devices) {

          if(devices.isNotEmpty) {
            _info.value = "Connected to ${devices.length} devices";
          } else {
            _info.value = "No devices connected";
          }
        });

      } else {
        _info.value = "Bluetooth is off";
      }
    });
  }

  joystick(StickDragDetails details) {
    _x.value = double.parse((details.x).toStringAsFixed(2));
    _y.value = double.parse((details.y).toStringAsFixed(2));
  }

  onLight() {
  }

  onHorn() {

  }
}
