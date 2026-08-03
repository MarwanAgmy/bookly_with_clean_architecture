import 'dart:convert';

import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String bnaseUrl = "https://www.googleapis.com/books/v1/";

  ApiService({required this._dio});

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$base64Url$endPoint');
    return response.data;
  }
}
