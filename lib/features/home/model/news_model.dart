import 'item_notice_model.dart';

class NewsIbgeModel {
  int? count;
  int? page;
  int? totalPages;
  int? nextPage;
  int? previousPage;
  int? showingFrom;
  int? showingTo;
  List<ItemNoticeIBGEModel>? items;

  NewsIbgeModel({
    this.count,
    this.page,
    this.totalPages,
    this.nextPage,
    this.previousPage,
    this.showingFrom,
    this.showingTo,
    this.items,
  });

  NewsIbgeModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    page = json['page'];
    totalPages = json['totalPages'];
    nextPage = json['nextPage'];
    previousPage = json['previousPage'];
    showingFrom = json['showingFrom'];
    showingTo = json['showingTo'];
    if (json['items'] != null) {
      items = List<ItemNoticeIBGEModel>.from(json['items'].map((x) => ItemNoticeIBGEModel.fromJson(x)));
    }
  }
}




