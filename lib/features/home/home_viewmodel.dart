import 'dart:async';

import 'package:flutter/foundation.dart';
import 'data/ibge_repository.dart';
import 'model/notice_model.dart';

class HomeViewModel extends ChangeNotifier {
  final IbgeRepository _ibgerepository = IbgeRepository();

  bool isLoading = true;
  late NewsIbgeModel news;
  List<NoticeIBGEModel> itemsNews = [];

  Future<void> getNewsEmphasis() async {
    isLoading = true;

    news = await _ibgerepository.getNoticeEmphasis();

    if (news.items != null && news.items!.isNotEmpty) {
      itemsNews = news.items!;
    }

    isLoading = false;
    notifyListeners();
  }
}
