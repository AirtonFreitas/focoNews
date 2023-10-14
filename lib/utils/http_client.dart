import 'package:http/http.dart' as http;

class HttpClient {
  final http.Client _client = http.Client();

  Future<http.Response> get(Uri url, {Map<String, String>? headers}) async {
    return _client.get(url, headers: headers);
  }

  Future<http.Response> post(Uri url, {Map<String, String>? headers, dynamic body}) async {
    return _client.post(url, headers: headers, body: body);
  }

  Future<http.Response> put(Uri url, {Map<String, String>? headers, dynamic body}) async {
    return _client.put(url, headers: headers, body: body);
  }

  Future<http.Response> delete(Uri url, {Map<String, String>? headers}) async {
    return _client.delete(url, headers: headers);
  }

  void close() {
    _client.close();
  }
}
