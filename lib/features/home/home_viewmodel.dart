import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:result_dart/result_dart.dart';
import 'data/get_news_ibge_usecase.dart';
import 'model/item_notice_model.dart';
import 'model/news_model.dart';

class HomeViewModel extends ChangeNotifier {
  final GetNewsIbgeUsecase _getNewsIbgeUsecase = GetNewsIbgeUsecase();

  bool isLoading = true;
  Result<NewsIbgeModel, String>? newsIbgeResult;
  List<ItemNoticeIBGEModel> itemsNewsIbge = [];

  Future<void> getNewsEmphasis() async {
    isLoading = true;
    notifyListeners();

    newsIbgeResult = await _getNewsIbgeUsecase.getNewsIbge();

    newsIbgeResult!.fold(
      (newsIbge) {
        if (newsIbge.items != null && newsIbge.items!.isNotEmpty) {
          itemsNewsIbge = newsIbge.items!;
        }
      },
      (error) {
        print(error);
      },
    );
    isLoading = false;
    notifyListeners();
  }
}
