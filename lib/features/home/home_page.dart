import 'package:flutter/material.dart';
import 'package:foco_news/features/home/home_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    homeViewModel.getNewsEmphasis();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        builder: (context, child) {
          return homeViewModel.isLoading
              ? const Center(child: CircularProgressIndicator())
              : _bodyPage();
        },
        animation: homeViewModel,
      ),
    );
  }

  Widget _bodyPage() {
    return Column(
      children: [_noticeCard()],
    );
  }

  Widget _noticeCard() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Text(homeViewModel.itemsNews.first.titulo!),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: homeViewModel.itemsNews.length,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 50,
                  child: Center(child: Text('${homeViewModel.itemsNews[index].titulo}')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
