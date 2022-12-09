import 'package:demo_block/Screen/ApiCall/Domain/Repositories/apicall_repository.dart';
import 'package:demo_block/Screen/ApiCall/Domain/Usecases/apicall_usecase.dart';
import 'package:demo_block/Screen/ApiCall/Presentation/Bloc/apicall_event.dart';
import 'package:demo_block/Screen/ApiCall/Presentation/Bloc/apicall_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiCallBloc extends Bloc<ApiCallEvent, ApiCallState> {
  final ApiCallRepository repository;
  ApiCallUseCase apiCallUseCase;
  static const int perPage = 5;
  int page = 1;
  bool limitRich = false;

  ApiCallBloc(this.repository, this.apiCallUseCase) : super(const InitialState()) {
    on<FetchApiEvent>((event, emit) async {
      emit(const LoaderState());
      try {
        if (!limitRich) {
          var result = await apiCallUseCase(UserGetApiCallParams(perPage: perPage, page: page));
          page++;
          result.fold((error) {
            return const ErrorState();
          }, (response) {
            if (response.data?.isNotEmpty ?? false) {
              limitRich = ((response.data?.length ?? 0) < perPage);
              emit(SuccessState(apiResModel: response, key: DateTime.now().millisecondsSinceEpoch.toString()));
            } else {
              limitRich = true;
              emit(const PageNotFoundState());
            }
          });
        }
      } catch (e, st) {
        print('ApiCallBloc e: $e  &&  st: $st');
        emit(ErrorState(errorMessage: e.toString()));
      }
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
