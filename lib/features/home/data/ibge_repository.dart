import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/notice_model.dart';

class IbgeRepository {
  Future<NewsIbgeModel> getNoticeEmphasis() async {
    NewsIbgeModel result = NewsIbgeModel();

    try {
      final uri = Uri.http(
        'servicodados.ibge.gov.br',
        '/api/v3/noticias/',
        {'qtd': '5'},
      );

      final http.Response response = await http.get(uri);
      print(response.body);

      if (response.statusCode == HttpStatus.ok) {
        final Map<String, dynamic> data = json.decode(response.body);
        result = NewsIbgeModel.fromJson(data);
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
    return result;
  }
}
