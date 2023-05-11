import 'package:car_controller/features/pad/controllers/ble.dart';
import 'package:car_controller/theme/size_config.dart';
import 'package:car_controller/widgets/template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BLEPage extends GetView<BLEController> {
  const BLEPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Template(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: SizeConfig.bH * 48,
            child: _devices(),
          ),
          SizedBox(
            width: SizeConfig.bH * 48,
            child: _info(),
          ),
        ],
      ),
    );
  }

  _devices() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Obx(
          () => ListView.builder(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.bV * 1,
              horizontal: SizeConfig.bH * 1,
            ),
            itemCount: controller.devices.length,
            itemBuilder: _device,
          ),
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () => controller.searchDevices(),
                child: const Text("Refresh"),),
            ElevatedButton(onPressed: () => Get.back(), child: const Text("Back")),
          ],
        ),
      ],
    );
  }

  Widget _device(ctx, int index) {
    return ListTile(
      key: ValueKey(index),
      title: Text(controller.device(index)),
      onTap: () => controller.info(index),
    );
  }

  _info() {
    return Obx(() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(":> ${controller.id}"),
          Text(":> ${controller.name}"),
          Text(":> ${controller.type}"),
          ElevatedButton(onPressed: () => controller.connect(), child: const Text("Connect"))
        ],
      ),
    );
  }
}
