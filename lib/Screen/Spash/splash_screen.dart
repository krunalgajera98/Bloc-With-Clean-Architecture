import 'package:demo_block/Helper/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../demo_bloc_app.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const routeName = '/SplashPage';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Future<void> getToken() async {
    SharedPrefs.saveToken('token');
    String token = await SharedPrefs.getToken();
    await Future.delayed(const Duration(seconds: 3));
    if (token != '') {
      Get.toNamed(HomePage.routeName);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('User Not Exist!'),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }
}
