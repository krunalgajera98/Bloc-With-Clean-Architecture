import 'package:demo_block/Screen/ApiCall/Presentation/Page/apicall_screen.dart';
import 'package:demo_block/Screen/Increment-Decrement/Bloc/in_dec_bloc.dart';
import 'package:demo_block/Screen/Increment-Decrement/Page/in_dec_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/HomePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InDecBloc>(
      create: (context) => InDecBloc(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late InDecBloc _inDecBloc;

  @override
  void initState() {
    super.initState();
    _inDecBloc = BlocProvider.of<InDecBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('HomePage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed(ApiCallPage.routeName);
              },
              child: const Text('ApiCall Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BlocProvider<InDecBloc>.value(
                      value: _inDecBloc,
                      child: const InDecPage(),
                    ),
                  ),
                );
              },
              child: const Text('Increment-Decrement demo'),
            ),
          ],
        ),
      ),
    );
  }
}
