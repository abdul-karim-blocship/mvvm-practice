abstract class BaseApiService {
  Future<dynamic> getGetApiResp({required String url});

  Future<dynamic> getPostApiResp({required String url, required dynamic body});
}
