import 'dart:convert';

import '../model/news_model.dart';
import 'ibge_repository.dart';

import 'package:http/http.dart' as http;
import 'package:result_dart/result_dart.dart';

class GetNewsIbgeUsecase {
  final IbgeRepository ibgeRepository = IbgeRepository();

  Future<Result<NewsIbgeModel, String>> getNewsIbge() async {
    try {
      final Result<http.Response, String> result =
          await ibgeRepository.getNoticeEmphasis();

      return result.fold(
        (response) {
          try {
            final Map<String, dynamic> data = json.decode(response.body);
            final NewsIbgeModel newsIbgeModel = NewsIbgeModel.fromJson(data);
            return Result.success(newsIbgeModel);
          } catch (e) {
            return Result.failure('Erro ao decodificar JSON: $e');
          }
        },
        (error) {
          return Result.failure('Erro de HTTP: $error');
        },
      );
    } catch (e) {
      print(e);
      return Result.failure('Erro USECASE ao buscar notícias: $e');
    }
  }
}
