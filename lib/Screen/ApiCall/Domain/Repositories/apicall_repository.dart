import 'package:demo_block/Screen/ApiCall/Domain/Entities/api_res_model.dart';
import 'package:dartz/dartz.dart';
abstract class ApiCallRepository {
  Future<Either<Fail,ApiResModel>> userGetApiCall({required int perPage,required int page});
}
