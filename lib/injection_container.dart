import 'package:demo_block/Screen/ApiCall/Data/DataSources/apicall_data_source.dart';
import 'package:demo_block/Screen/ApiCall/Data/Repository/apicall_repository_impl.dart';
import 'package:demo_block/Screen/ApiCall/Domain/Repositories/apicall_repository.dart';
import 'package:demo_block/Screen/ApiCall/Domain/Usecases/apicall_usecase.dart';
import 'package:demo_block/Screen/ApiCall/Presentation/Bloc/apicall_bloc.dart';
import 'package:get_it/get_it.dart';

//flutter pub run build_runner build --delete-conflicting-outputs
GetIt sl = GetIt.instance;

Future<void> getItInit() async {
  // Bloc
  sl.registerFactory(() => ApiCallBloc(sl(), sl()));
  // Use cases
  sl.registerLazySingleton<ApiCallDataSource>(() => ApiCallDataSourceImpl());
  // Repository
  sl.registerLazySingleton<ApiCallRepository>(() => ApiCallRepositoryImpl(apiCallDataSource: sl()));
  sl.registerFactory(() => ApiCallUseCase(apiCallRepository:  sl()));
}
