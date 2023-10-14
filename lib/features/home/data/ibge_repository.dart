import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:result_dart/result_dart.dart';

import '../../../utils/http_client.dart';

class IbgeRepository {
  final HttpClient _httpClient = HttpClient();

  Future<Result<http.Response, String>> getNoticeEmphasis() async {
    try {
      final uri = Uri.http(
        'servicodados.ibge.gov.br',
        '/api/v3/noticias/',
        {'qtd': '3'},
      );

      final http.Response response = await _httpClient.get(uri);

      if (response.statusCode == HttpStatus.ok) {
        return Result.success(response);
      } else {
        return Result.failure('Erro de HTTP: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
      throw Exception('Erro no repositório ao buscar notícias: $e');
    }
  }
}
