import 'dart:convert';

import 'images_news_model.dart';


class ItemNoticeIBGEModel {
  int? id;
  String? tipo;
  String? titulo;
  String? introducao;
  String? dataPublicacao;
  int? produtoId;
  String? produtos;
  String? editorias;
  ImagesIBGEModel? imagens;
  String? produtosRelacionados;
  bool? destaque;
  String? link;

  ItemNoticeIBGEModel({
    this.id,
    this.tipo,
    this.titulo,
    this.introducao,
    this.dataPublicacao,
    this.produtoId,
    this.produtos,
    this.editorias,
    this.imagens,
    this.produtosRelacionados,
    this.destaque,
    this.link,
  });

  factory ItemNoticeIBGEModel.fromJson(Map<String, dynamic> json) {
    final imagensJson = jsonDecode(json['imagens']);
    final ImagesIBGEModel imagens = ImagesIBGEModel.fromJson(imagensJson);

    return ItemNoticeIBGEModel(
      id: json['id'],
      tipo: json['tipo'],
      titulo: json['titulo'],
      introducao: json['introducao'],
      dataPublicacao: json['data_publicacao'],
      produtoId: json['produto_id'],
      produtos: json['produtos'],
      editorias: json['editorias'],
      imagens: imagens,
      produtosRelacionados: json['produtos_relacionados'],
      destaque: json['destaque'],
      link: json['link'],
    );
  }
}
