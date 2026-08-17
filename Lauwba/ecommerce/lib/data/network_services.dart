import 'package:ecommerce/utils/logger.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';

class NetworkServices {
  String _baseUrl = "http://10.111.84.247:8000/api";
  Duration _timeout = Duration(seconds: 30);

  setBaseUrl(String? baseUrl) {
    if (baseUrl != null) {
      _baseUrl = baseUrl;
    }
  }

  _headers(String? token, String tokenType, {bool? isJson}) {
    Map<String, String> headers = {
      'Accept': 'application/json',
    };
    if (token == null) {
      headers['Content-Type'] = "application/x-www-form-urlencoded";
    }
    if (isJson != null && isJson) {
      headers['Content-Type'] = "application/json";
    }
    if (tokenType == "Bearer") {
      headers['Authorization'] = "Bearer $token";
    } else if (tokenType == "Key") {
      headers['Key'] = token!;
    }

    return headers;
  }

  Future<Map<String, dynamic>> get(
      String endpoint, {
        String? token,
        Map<String, dynamic>? body,
        String tokenType = "Bearer",
      }) async {
    AppLogger.i("Sedang Request....\nEndpoint : $_baseUrl$endpoint");
    try {
      final url = Uri.parse(_baseUrl + endpoint);
      final headers = _headers(token, tokenType);
      final response = await http.get(url, headers: headers).timeout(_timeout);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        AppLogger.i("Response Berhasil\nBody : ${response.body}");
        return jsonDecode(response.body);
      } else {
        throw "Error : ${response.statusCode} : ${response.body}";
      }
    } catch (ex) {
      AppLogger.e("Response Error");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> put(
      String endpoint, {
        String? token,
        Map<String, dynamic>? body,
        String tokenType = "Bearer",
      }) async {
    AppLogger.i("Sedang Request....\nEndpoint : $_baseUrl$endpoint");
    try {
      final url = Uri.parse(_baseUrl + endpoint);
      final headers = _headers(token, tokenType);
      final response = await http
          .put(url, body: body, headers: headers)
          .timeout(_timeout);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        AppLogger.i("Response Berhasil\nBody : ${response.body}");
        return jsonDecode(response.body);
      } else {
        throw "Error : ${response.statusCode} : ${response.body}";
      }
    } catch (ex) {
      AppLogger.e("Response Error");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> post(
      String endpoint, {
        String? token,
        Map<String, dynamic>? body,
        String tokenType = "Bearer",
        bool isJson = false,
      }) async {
    AppLogger.i("Sedang Request....\nEndpoint : $_baseUrl$endpoint");
    try {
      final url = Uri.parse(_baseUrl + endpoint);
      final headers = _headers(token, tokenType, isJson : isJson);
      final response = await http
          .post(url, body: (isJson) ? jsonEncode(body) : body, headers: headers)
          .timeout(_timeout);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        AppLogger.i("Response Berhasil\nBody : ${response.body}");
        return jsonDecode(response.body);
      } else {
        throw "Error : ${response.statusCode} : ${response.body}";
      }
    } catch (ex) {
      AppLogger.e("Response Error $ex");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> delete(
      String endpoint, {
        String? token,
        String tokenType = "Bearer",
      }) async {
    AppLogger.i("Sedang Request....\nEndpoint : $_baseUrl$endpoint");
    try {
      final url = Uri.parse(_baseUrl + endpoint);
      final headers = _headers(token, tokenType);
      final response = await http
          .delete(url, headers: headers)
          .timeout(_timeout);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        AppLogger.i("Response Berhasil\nBody : ${response.body}");
        return jsonDecode(response.body);
      } else {
        throw "Error : ${response.statusCode} : ${response.body}";
      }
    } catch (ex) {
      AppLogger.e("Response Error $ex");
      rethrow;
    }
  }
}
