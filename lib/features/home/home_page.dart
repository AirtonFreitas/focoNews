import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foco_news/features/home/home_viewmodel.dart';
import 'package:foco_news/features/news_details/news_details_page.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    loadNews();
    super.initState();
  }

  final HomeViewModel viewmodel = HomeViewModel();

  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();
  final List<Widget> _widgetsCarousel = [];

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.yellow,
    // ));

    return Scaffold(
      body: SafeArea(
        child: AnimatedBuilder(
          builder: (context, child) {
            return _bodyPage();
          },
          animation: viewmodel,
        ),
      ),
    );
  }

  Widget _bodyPage() {
    return Column(
      children: [carousel(), dotIndicator()],
    );
  }

  Widget carousel() {
    return CarouselSlider(
      carouselController: _carouselController,
      items: _widgetsCarousel,
      options: CarouselOptions(
          height: 260,
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          },
          autoPlay: true),
    );
  }

  Widget dotIndicator() {
    return _widgetsCarousel.isNotEmpty
        ? DotsIndicator(
            dotsCount: _widgetsCarousel.length,
            position: _currentIndex,
            decorator: const DotsDecorator(
              color: Colors.grey,
              activeColor: Colors.red,
            ),
          )
        : const SizedBox.shrink();
  }

  void loadNews() async {
    await viewmodel.getNewsEmphasis();
    addCarousel();
  }

  void addCarousel() {
    _widgetsCarousel.addAll(viewmodel.itemsNewsIbge.map((item) {
      return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => NewsDetailsPage(newItem: item)));
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Skeletonizer(
            enabled: viewmodel.isLoading || viewmodel.itemsNewsIbge.isEmpty,
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        height: 260,
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(36),
                            bottomLeft: Radius.circular(36)),
                        child: Image.network(
                          'https://agenciadenoticias.ibge.gov.br/${item.imagens!.imageIntro}',
                          width: MediaQuery.sizeOf(context).width,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: -0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(6),
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          color: Colors.red,
                          child: Text(
                            item.titulo!,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }));
  }
}
