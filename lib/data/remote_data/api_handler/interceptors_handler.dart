import "package:dio/dio.dart";

import "../../local_resource/data_store.dart";

class ClientInterceptor extends Interceptor {
  @override
  void onRequest(options, handler) {
    options.headers = {
      "Authorization": 'Bearer ${DataStore.instance.token ?? ''}',
      "Accept": '*/*',
    };
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data == "error") {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: response.data["msg"] ?? response.data["message"],
          type: DioExceptionType.badResponse,
        ),
      );
    } else {
      handler.resolve(response);
    }
  }
}
