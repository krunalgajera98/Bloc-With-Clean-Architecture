import 'package:demo_block/Screen/ApiCall/Data/DataSources/apicall_data_source.dart';
import 'package:demo_block/Screen/ApiCall/Domain/Entities/api_res_model.dart';
import 'package:demo_block/Screen/ApiCall/Domain/Repositories/apicall_repository.dart';
import 'package:dartz/dartz.dart';
class ApiCallRepositoryImpl extends ApiCallRepository {
  ApiCallDataSource apiCallDataSource;

  ApiCallRepositoryImpl({required this.apiCallDataSource});

  @override
  Future<Either<Fail,ApiResModel>> userGetApiCall({required int perPage, required int page}) async {
    try {
      ApiResModel apiResModel = await apiCallDataSource.getModel(page: page, perPage: perPage);
      return Right(apiResModel);
    } catch (e) {
      return Left(Fail(ApiResModel()));
    }
  }
}

