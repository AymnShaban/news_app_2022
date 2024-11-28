import 'package:dio/dio.dart';
// d3fa4bb5c3144211959ebad1982d53ed
class DioHelper
{
  static Dio? dio;
  static init(){
    dio = Dio(
BaseOptions(
  baseUrl: 'https://newsapi.org/',
  receiveDataWhenStatusError: true,

)
    );
  }
 static Future<Response<dynamic>?> getData({
  required String url,
  required Map<String,dynamic> query,
})async
  {
   return await dio?.get(url, queryParameters: query, );

  }
}