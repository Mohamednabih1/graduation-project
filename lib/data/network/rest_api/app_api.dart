import 'package:dio/dio.dart';
import 'package:retrofit/http.dart' hide Headers;
import 'package:gradproject/app/constants/network_constants.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: "http://192.168.1.22:8080/HI_GF")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST(ServerPaths.loginPath)
  Future<Response<Map<String, dynamic>>> login(
    @Field("a") String username,
    @Field("b") String password,
  );
}
