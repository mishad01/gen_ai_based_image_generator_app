import 'dart:convert';

import 'package:gen_ai_based_image_generator_app/data/service/network_response.dart';
import 'package:http/http.dart' as http;

class NetworkCaller {
  static Future<NetworkResponse> postRequest({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body != null ? jsonEncode(body) : null,
      );
      if (response.statusCode == 200) {
        return NetworkResponse(
          stausCode: response.statusCode,
          isSuccess: true,
          responseData: jsonDecode(response.body),
        );
      } else {
        return NetworkResponse(
          stausCode: response.statusCode,
          isSuccess: false,
          responseData: jsonDecode(response.body),
          errorMessage: 'Request failed with status : ${response.statusCode}',
        );
      }
    } catch (e) {
      return NetworkResponse(
        stausCode: -1,
        isSuccess: false,
        responseData: 'Network error: $e',
      );
    }
  }
}
