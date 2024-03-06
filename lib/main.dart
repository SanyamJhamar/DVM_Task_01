import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/home_screen.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'api_response.freezed.dart';

part 'api_response.g.dart';

void main(){
  runApp(Pokedex());
}
class Pokedex extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class DioClient {
  final Dio _dio;

  DioClient(this._dio);

  Future<Response> get(String url) => _dio.get(url);
  Future<Response> post(String url, {data, queryParameters}) =>
      _dio.post(url, data: data, queryParameters: queryParameters);
}

@freezed

class ApiResponse<T> with _$ApiResponse<T> {

  const factory ApiResponse.success(T data) = ApiResponseSuccess;

  const factory ApiResponse.failure(dynamic error) = ApiResponseFailure;

}






