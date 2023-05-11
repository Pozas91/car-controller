import 'package:car_controller/routing/app.dart';
import 'package:car_controller/routing/routes.dart';
import 'package:car_controller/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

_initPlugins() async {
  // Method to ensure that app wait until prefs is loaded.
  WidgetsFlutterBinding.ensureInitialized();

  // Load users prefs
  await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
}

main() async {
  // Wait until all plugins are loaded.
  await _initPlugins();

  runApp(const CarController());
}


class CarController extends StatelessWidget {
  const CarController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Nigmex",
      themeMode: ThemeMode.system,
      theme: myTheme,
      darkTheme: myTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.pad.v,
      defaultTransition: Transition.fade,
      getPages: appPages(),
    );
  }
}