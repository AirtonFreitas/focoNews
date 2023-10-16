import 'package:flutter/material.dart';
import 'package:foco_news/features/home/model/item_notice_model.dart';

class NewsDetailsPage extends StatefulWidget {
  const NewsDetailsPage({super.key, required this.newItem});

  final ItemNoticeIBGEModel newItem;

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('askjdb')), body: _body());
  }

  Widget _body() {
    return Column(
      children: [
        Image.network(
          'https://agenciadenoticias.ibge.gov.br/${widget.newItem.imagens!.imageIntro}',
          width: MediaQuery.sizeOf(context).width,
          height: 250,
        ),
        Text(widget.newItem.titulo!),
        Text(widget.newItem.introducao!),
      ],
    );
  }
}
