import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class API {
  static Future<Map<String, dynamic>> get(String url,
      {Map<String, dynamic> headers}) async {
    var result = await http.get(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader:
          'Bearer AAAAAAAAAAAAAAAAAAAAAGg9PQEAAAAAPoy1bTDvZht0UflV0N0NBEoSWyQ%3DCs2ePRJbKQ3zhlMEpe7kmRKuey4vLJVgVW8Zhj0UuW5wOpIHHE',
      if (headers != null) ...headers
    });
    return (json.decode(result.body) as Map<String, dynamic>);
  }
}
