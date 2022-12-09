import 'package:demo_block/Screen/ApiCall/Presentation/Page/apicall_screen.dart';
import 'package:demo_block/Screen/Increment-Decrement/Page/in_dec_screen.dart';
import 'package:demo_block/Screen/Spash/splash_screen.dart';
import 'package:demo_block/demo_bloc_app.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: SplashPage.routeName,
      page: () => const SplashPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: HomePage.routeName,
      page: () => const HomePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: InDecPage.routeName,
      page: () => const InDecPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: ApiCallPage.routeName,
      page: () => const ApiCallPage(),
      transition: Transition.fadeIn,
    ),
  ];
}
