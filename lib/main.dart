import 'package:demo_block/Screen/MyApp/my_app.dart';
import 'package:demo_block/injection_container.dart';
import 'package:flutter/material.dart';
import 'Helper/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItInit();
  await SharedPrefs.initMySharedPreferences();
  runApp(const MyApp());
}
