import 'package:advanced_flutter_tutorial/app/constants.dart';
import 'package:advanced_flutter_tutorial/data/responses/responses.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/customer/login")
  Future<AuthResponse> login(
    @Field("email") String email,
    @Field("password") String passowrd,
  );
}
