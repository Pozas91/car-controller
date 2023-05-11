import 'package:car_controller/features/pad/controllers/pad.dart';
import 'package:car_controller/routing/routes.dart';
import 'package:car_controller/theme/size_config.dart';
import 'package:car_controller/widgets/template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:get/get.dart';

class PadPage extends GetView<PadController> {
  const PadPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Template(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [_actions(), _joysticks()],
      ),
    );
  }

  _actions() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [_bleInfo(), _carOptions()],
    );
  }

  _bleInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Obx(
          () => ElevatedButton(
            onPressed: () => Get.toNamed(Routes.ble.v),
            child: controller.info.toString().isEmpty
                ? Text(controller.info)
                : Text(controller.info),
          ),
        ),
      ],
    );
  }

  _carOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () => controller.onLight(),
          child: const Icon(Icons.light_mode),
        ),
        SizedBox(width: SizeConfig.bH * 4),
        ElevatedButton(
          onPressed: () => controller.onHorn(),
          child: const Icon(Icons.volume_up),
        ),
      ],
    );
  }

  _joysticks() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Joystick(listener: (details) => controller.joystick(details)),
        Obx(() => Text("X: ${controller.x}, Y: ${controller.y}")),
      ],
    );
  }
}
