import 'package:starter_kit_ipp/core/config/env/env.dart';
import 'package:starter_kit_ipp/core/service/remote/auth.dart';
import 'package:starter_kit_ipp/core/utils/common_res.entity.dart';
import 'package:dio/dio.dart';

/// TODO: replace with local db data
const token =
    "beyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk2ODM3Njc4LCJpYXQiOjE2OTY4MzQwNzgsImp0aSI6ImQzZjkwMjg5ZTBkMDQ4M2Q5MmJlYTFhZTQzODEyOWEyIiwidXNlcl9pZCI6ImI1NWIyYTRmLWZkMzMtNGU1YS05OTA3LTFlN2JjMmVlZTIxYyIsImVtYWlsIjoiYWRtaW5AZ21haWwuY29tIiwiaXNfc3VwZXJ1c2VyIjp0cnVlLCJpc19zdGFmZiI6dHJ1ZX0.5DWt3zIG09MOpA9aAycb-tFCzN8fuM7_l1tH7FBli1E";

///
const refresh =
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwNDYxMDA3OCwiaWF0IjoxNjk2ODM0MDc4LCJqdGkiOiJlYTFkM2IwMDMzNjk0M2Y1YWE4OGNkYzg0NzRjMGUzZCIsInVzZXJfaWQiOiJiNTViMmE0Zi1mZDMzLTRlNWEtOTkwNy0xZTdiYzJlZWUyMWMiLCJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSIsImlzX3N1cGVydXNlciI6dHJ1ZSwiaXNfc3RhZmYiOnRydWV9.KU4GbrUqVZIIFd8kxCfe5rgJbDbpJMae5mX7AN1Jojs";

/// base [Interceptor] for [Dio]. this interceptor is responsible for
/// add `Authorization` header. and if any request got a response of `401` status code
/// then it will try to refresh token and and then try to request
class BaseInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final dio = Dio();
      dio.options.headers['Authorization'] = 'Bearer $refresh';
      dio.options.baseUrl = EnvProd.host;
      final res = await RemoteAuth(dio).getRefreshToken({"refresh": refresh});
      final data = ResponseEntity<RefreshToken>.fromJson(
        res as Map<String, dynamic>,
        (json) => res['data'] as RefreshToken,
      ).data;
      err.requestOptions.headers['Authorization'] = 'Bearer ${data.access}';
      return handler.resolve(await dio.fetch(err.requestOptions));
    }
    super.onError(err, handler);
  }
}

///
class RefreshToken {
  ///
  final String access;

  ///
  RefreshToken({required this.access});
}
