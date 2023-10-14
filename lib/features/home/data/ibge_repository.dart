import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:result_dart/result_dart.dart';

class IbgeRepository {
  Future<Result<http.Response, String>> getNoticeEmphasis() async {
    try {
      final uri = Uri.http(
        'servicodados.ibge.gov.br',
        '/api/v3/noticias/',
        {'qtd': '10'},
      );

      final http.Response response = await http.get(uri);
      if (response.statusCode == HttpStatus.ok) {
        return Result.success(response);
      } else {
        return Result.failure('Erro de HTTP: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
      return Result.failure('Erro REPOSITORY ao buscar notícias: $e');
    }
  }
}
