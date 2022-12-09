import 'package:demo_block/Screen/Spash/splash_screen.dart';
import 'package:demo_block/Utils/NavigationUtils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBinding(),
      getPages: Routes.pages,
      initialRoute: SplashPage.routeName,
    );
  }
}

class AppBinding extends Bindings {
  @override
  void dependencies() {}
}
