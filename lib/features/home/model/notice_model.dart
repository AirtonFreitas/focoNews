import 'package:foco_news/features/home/model/images_notice_model.dart';

class NewsIbgeModel {
  int? count;
  int? page;
  int? totalPages;
  int? nextPage;
  int? previousPage;
  int? showingFrom;
  int? showingTo;
  List<NoticeIBGEModel>? items;

  NewsIbgeModel(
      {this.count,
        this.page,
        this.totalPages,
        this.nextPage,
        this.previousPage,
        this.showingFrom,
        this.showingTo,
        this.items});

  NewsIbgeModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    page = json['page'];
    totalPages = json['totalPages'];
    nextPage = json['nextPage'];
    previousPage = json['previousPage'];
    showingFrom = json['showingFrom'];
    showingTo = json['showingTo'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(NoticeIBGEModel.fromJson(v));
      });
    }

  }
}

class NoticeIBGEModel {
  int? id;
  String? tipo;
  String? titulo;
  String? introducao;
  String? dataPublicacao;
  int? produtoId;
  String? produtos;
  String? editorias;
  ImagesIBGEModel? imagens; // Agora é uma instância da classe ImagensIBGEModel
  String? produtosRelacionados;
  bool? destaque;
  String? link;

  NoticeIBGEModel({
    this.id,
    this.tipo,
    this.titulo,
    this.introducao,
    this.dataPublicacao,
    this.produtoId,
    this.produtos,
    this.editorias,
    this.imagens, // Agora é do tipo ImagensIBGEModel
    this.produtosRelacionados,
    this.destaque,
    this.link,
  });

  NoticeIBGEModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tipo = json['tipo'];
    titulo = json['titulo'];
    introducao = json['introducao'];
    dataPublicacao = json['data_publicacao'];
    produtoId = json['produto_id'];
    produtos = json['produtos'];
    editorias = json['editorias'];
    imagens = ImagesIBGEModel.fromJson(json); // Agora está criando uma instância de ImagensIBGEModel
    produtosRelacionados = json['produtos_relacionados'];
    destaque = json['destaque'];
    link = json['link'];
  }
}

