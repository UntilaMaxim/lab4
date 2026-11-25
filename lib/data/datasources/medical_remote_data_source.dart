
import 'dart:convert';

import 'package:http/http.dart' as http;

class MedicalRemoteDataSource {
  static const String baseUrl =
      'https://test-api-jlbn.onrender.com/lab2026/v2';

  Future<Map<String, dynamic>> getFeed() {
    return _getJson('$baseUrl/feed');
  }

  Future<Map<String, dynamic>> getDetails() {
    return _getJson('$baseUrl/feed/details');
  }

  Future<Map<String, dynamic>> _getJson(String url) async {
    final response = await http.get(
      Uri.parse(url),
      headers: {'Accept': 'application/json'},
    ).timeout(const Duration(seconds: 30));

    if (response.statusCode != 200) {
      throw Exception(
        'Eroare server: HTTP ${response.statusCode}',
      );
    }

    final decoded = jsonDecode(
      utf8.decode(response.bodyBytes),
    );

    if (decoded is! Map<String, dynamic>) {
      throw const FormatException(
        'Serverul a returnat un JSON invalid',
      );
    }

    return decoded;
  }
}
