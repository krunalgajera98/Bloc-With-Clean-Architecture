import 'package:dartz/dartz.dart';
import 'package:demo_block/Helper/use_cases.dart';
import 'package:demo_block/Screen/ApiCall/Domain/Entities/api_res_model.dart';
import 'package:demo_block/Screen/ApiCall/Domain/Repositories/apicall_repository.dart';
import 'package:equatable/equatable.dart';

class ApiCallUseCase implements UseCase<ApiResModel, UserGetApiCallParams> {
  ApiCallRepository apiCallRepository;

  ApiCallUseCase({required this.apiCallRepository});

  @override
  Future<Either<Fail, ApiResModel>> call(UserGetApiCallParams params) async {
    return await apiCallRepository.userGetApiCall(perPage: params.perPage, page: params.page);
  }
}

class UserGetApiCallParams extends Equatable {
  final int page;
  final int perPage;

  const UserGetApiCallParams({required this.page, required this.perPage});

  @override
  List<Object> get props => [page, perPage];
}
