import 'package:dio/dio.dart';
import 'package:pharmacist_app/helper/varibles.dart';

class DioHelper{
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: '$projectUrlVar/api/',
      headers: {
        "Content-Type" : 'application/json',
        "Accept" :'application/json',
      },
      receiveTimeout: Duration(seconds: 10000),
      receiveDataWhenStatusError: true,
    )
  );

  static Future<Response> postData({required String url , Map<String ,dynamic>? query , required Map<String ,dynamic> data , String? token})async{
    dio.options.headers['Authorization'] = "Bearer $token";
    Response response =  await dio.post(url , queryParameters: query , data: data);
    return response;
  }
}

