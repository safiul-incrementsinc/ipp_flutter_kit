import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth.g.dart';

@RestApi(baseUrl: '/api/user')
abstract class RemoteAuth {
  factory RemoteAuth(Dio dio, {String baseUrl}) = _RemoteAuth;

  @POST('/token/refresh/')
  Future getRefreshToken(@Body() Map<String, String> body);
}
