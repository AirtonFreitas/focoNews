import 'package:flutter/material.dart';
import 'package:foco_news/features/home/home_viewmodel.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final HomeViewModel viewmodel = HomeViewModel();

  @override
  void initState() {
    viewmodel.getNewsEmphasis();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        builder: (context, child) {
          return _bodyPage();
        },
        animation: viewmodel,
      ),
    );
  }

  Widget _bodyPage() {
    return Column(
      children: [_noticeCard()],
    );
  }

  Widget _noticeCard() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Skeletonizer(
        enabled: viewmodel.isLoading,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(viewmodel.itemsNews.isNotEmpty ? viewmodel.itemsNews.first.titulo! : _exampleTitle()),
            Text(viewmodel.itemsNews.isNotEmpty ? viewmodel.itemsNews.first.introducao! : _exampleIntroduction()),
            // Image.network(viewmodel.itemsNews.isNotEmpty ? '${viewmodel.itemsNews.first.imagens!}' : ''),
          ],
        ),
      ),
    );
  }

  String _exampleTitle(){
    return '____________________________________';
  }
  String _exampleIntroduction(){
    return '_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________';
  }

}
