// ignore_for_file: unused_import

import 'package:feirapp/controllers/login_controller.dart';
import 'package:feirapp/models/dtos/login_dto.dart';
import 'package:feirapp/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token = '';
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getData(String uri) async {
    try {
      _mainHeaders['Authorization'] = 'Bearer $token';
      Response response = await get(uri, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, String body) async {
    try {
      _mainHeaders['Authorization'] = 'Bearer $token';
      Response response = await post(uri, body, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postAuth(String uri, LoginDTO login) async {
    try {
      Response response = await post(uri, login.toJson());
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> putData(String uri, String body) async {
    try {
      _mainHeaders['Authorization'] = 'Bearer $token';
      Response response = await put(uri, body, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
