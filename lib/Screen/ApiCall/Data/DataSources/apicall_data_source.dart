import 'package:demo_block/Helper/network_helper.dart';
import 'package:demo_block/Screen/ApiCall/Domain/Entities/api_res_model.dart';

abstract class ApiCallDataSource {
  Future<ApiResModel> getModel({int perPage, int page});
}

class ApiCallDataSourceImpl implements ApiCallDataSource {
  final NetworkAPICall _networkAPICall = NetworkAPICall();

  @override
  Future<ApiResModel> getModel({int? perPage, int? page}) async {
    try {
      final request = await _networkAPICall.get('users?page=$page');
      if (request != null) {
        return ApiResModel.fromJson(request);
      } else {
        return request;
      }
    } catch (e) {
      rethrow;
    }
  }
}
