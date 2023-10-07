import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foco_news/features/home/home_viewmodel.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    viewmodel.getNewsEmphasis();
    super.initState();
  }

  final HomeViewModel viewmodel = HomeViewModel();

  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();
  final List<Widget> _widgetsCarousel = [];

  //
  // void addToCarousel() {
  //   for (int i = 0; i < _widgetsCarousel.length; i++) {
  //     if (_widgetsCarousel[i] is Text) {
  //       Text textWidget = _widgetsCarousel[i] as Text;
  //       String noticia = textWidget.data ?? '';
  //       // Faça o que precisar com a variável "noticia"
  //     }
  //   }  }

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
      children: [carousel()],
    );
  }

  Widget carousel() {
    // _widgetsCarousel.addAll(viewmodel.itemsNewsIbge.map((item) {
    //   return Skeletonizer(
    //     enabled: viewmodel.isLoading || viewmodel.itemsNewsIbge.isEmpty,
    //     child: Column(
    //       children: [
    //         Text(viewmodel.itemsNewsIbge.isNotEmpty
    //             ? item.titulo!
    //             : _exampleTitle()),
    //         Text(viewmodel.itemsNewsIbge.isNotEmpty
    //             ? item.introducao!
    //             : _exampleIntroduction()),
    //         viewmodel.itemsNewsIbge.isNotEmpty
    //             ? Image.network(
    //           'https://agenciadenoticias.ibge.gov.br/${item.imagens!.imageIntro}',
    //           width: 200,
    //         )
    //             : const Skeleton.replace(
    //             width: 200,height: 100,
    //             child: SizedBox.shrink()),
    //       ],
    //     ),
    //   );
    // }));
    //
    //
    // return   CarouselSlider(
    //   carouselController: _carouselController,
    //   items: _widgetsCarousel,
    //   options: CarouselOptions(
    //     onPageChanged: (index, reason) {
    //       setState(() {
    //         _currentIndex = index;
    //       });
    //     },
    //   ),
    // );

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Skeletonizer(
        enabled: viewmodel.isLoading || viewmodel.itemsNewsIbge.isEmpty,
        child: Column(
          children: [
            Text(viewmodel.itemsNewsIbge.isNotEmpty
                ? viewmodel.itemsNewsIbge.first.titulo!
                : _exampleTitle()),
            Text(viewmodel.itemsNewsIbge.isNotEmpty
                ? viewmodel.itemsNewsIbge.first.introducao!
                : _exampleIntroduction()),
            viewmodel.itemsNewsIbge.isNotEmpty
                ? Image.network(
                    'https://agenciadenoticias.ibge.gov.br/${viewmodel.itemsNewsIbge.first.imagens!.imageIntro}',
                    width: 200,
                  )
                : const Skeleton.replace(
                    width: 200, height: 100, child: SizedBox.shrink()),
          ],
        ),
      ),
    );
  }

  Widget _carousel() {
    return CarouselSlider(
      carouselController: _carouselController,
      items: _widgetsCarousel,
      options: CarouselOptions(
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
    // DotsIndicator(
    // dotsCount: _widgetsCarousel.length,
    // position: _currentIndex,
    // decorator: const DotsDecorator(
    // color: Colors.grey,
    // activeColor: ColorsUtil.bluetwo,
    // ),
    // ),
  }

  String _exampleTitle() {
    return '____________________________________';
  }

  String _exampleIntroduction() {
    return '_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________';
  }
}
