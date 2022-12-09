import 'package:demo_block/Screen/ApiCall/Domain/Entities/api_res_model.dart';
import 'package:demo_block/Screen/ApiCall/Presentation/Bloc/apicall_bloc.dart';
import 'package:demo_block/Screen/ApiCall/Presentation/Bloc/apicall_event.dart';
import 'package:demo_block/Screen/ApiCall/Presentation/Bloc/apicall_state.dart';
import 'package:demo_block/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiCallPage extends StatelessWidget {
  static const routeName = '/ApiCallPage';

  const ApiCallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ApiCallBloc>(
      create: (_) => sl<ApiCallBloc>(),
      child: const ApiCallView(),
    );
  }
}

class ApiCallView extends StatefulWidget {
  const ApiCallView({Key? key}) : super(key: key);

  @override
  State<ApiCallView> createState() => _ApiCallViewState();
}

class _ApiCallViewState extends State<ApiCallView> {
  late ApiCallBloc _apiCallBloc;
  final ScrollController _scrollController = ScrollController();
  final List<ApiResData> apiResData = [];

  @override
  void initState() {
    _apiCallBloc = BlocProvider.of<ApiCallBloc>(context);
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          // You're at the top.
        } else {
          _apiCallBloc.limitRich ? null : _apiCallBloc.add(FetchApiEvent());
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ApiCallBloc, ApiCallState>(
              builder: (context, state) {
                print('state ==> $state');
                if (state is InitialState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SuccessState) {
                  apiResData.addAll(state.apiResModel.data ?? []);
                  print('ApiSuccessState : ${state.apiResModel.data?.length ?? 0}');
                }
                return ListView.builder(
                  itemCount:
                      BlocProvider.of<ApiCallBloc>(context).limitRich ? apiResData.length : apiResData.length + 1,
                  shrinkWrap: true,
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    print('index : $index');
                    return (index >= apiResData.length)
                        ? const SizedBox(
                            height: 100,
                            width: 250,
                            child: Center(child: CircularProgressIndicator()),
                          )
                        : Container(
                            padding: const EdgeInsets.all(50),
                            margin: const EdgeInsets.all(20),
                            color: Colors.lightBlueAccent,
                            height: 300,
                            width: 250,
                            child: Text('${apiResData[index].id}'),
                          );
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _apiCallBloc.add(FetchApiEvent());
            },
            child: const Text('FetchApiEvent'),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
/*import 'package:demo_block/Screen/ApiCall/Domain/Entities/api_res_model.dart';

import 'package:demo_block/Screen/ApiCall/Data/Repository/apicall_repository_impl.dart';
import 'package:demo_block/Screen/ApiCall/Presentation/Bloc/apicall_bloc.dart';
import 'package:demo_block/Screen/ApiCall/Presentation/Bloc/apicall_event.dart';
import 'package:demo_block/Screen/ApiCall/Presentation/Bloc/apicall_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ApiCallBloc(HomeRepositoryImpl()),
      child: ApiCallView(),
    );
  }
}

class ApiCallView extends StatefulWidget {
  @override
  State<ApiCallView> createState() => _HomeViewState();
}

class _HomeViewState extends State<ApiCallView> {
  // late InDecBloc _inDecBloc;
  late ApiCallBloc _homeBloc;
  final ScrollController _scrollController = ScrollController();
  final List<ApiResData> apiResData = [];

  @override
  void initState() {
    _homeBloc = BlocProvider.of<ApiCallBloc>(context);
    // _inDecBloc = BlocProvider.of<InDecBloc>(context);
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          // You're at the top.
        } else {
          _homeBloc.limitRich ? null : _homeBloc.add(FetchApiEvent());
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ApiCallBloc, HomeState>(
              builder: (context, state) {
                print('state ==> $state');
                if (state is HomeInitial) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ApiSuccessState) {
                  apiResData.addAll(state.apiResModel.data ?? []);
                  print('ApiSuccessState : ${state.apiResModel.data?.length ?? 0}');
                }
                return ListView.builder(
                  itemCount: BlocProvider.of<ApiCallBloc>(context).limitRich ? apiResData.length : apiResData.length + 1,
                  shrinkWrap: true,
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    print('index : $index');
                    return (index >= apiResData.length)
                        ? const SizedBox(
                            height: 100,
                            width: 250,
                            child: Center(child: CircularProgressIndicator()),
                          )
                        : Container(
                            padding: const EdgeInsets.all(50),
                            margin: const EdgeInsets.all(20),
                            color: Colors.lightBlueAccent,
                            height: 300,
                            width: 250,
                            child: Text('${apiResData[index].id}'),
                          );
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _homeBloc.add(FetchApiEvent());
            },
            child: const Text('FetchApiEvent'),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
*/
