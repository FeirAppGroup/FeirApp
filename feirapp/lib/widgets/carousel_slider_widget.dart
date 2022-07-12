import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({Key? key}) : super(key: key);

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  final urlImages = [
    'https://cdn.pixabay.com/photo/2010/12/13/10/05/berries-2277_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/01/20/15/06/oranges-1995056_960_720.jpg',
    'https://cdn.pixabay.com/photo/2016/07/22/09/59/fruits-1534494__340.jpg',
    'https://cdn.pixabay.com/photo/2016/11/30/15/23/apples-1873078_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/01/31/09/30/raspberries-2023404_960_720.jpg',
    'https://cdn.pixabay.com/photo/2016/01/03/17/59/bananas-1119790_960_720.jpg',
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              itemCount: urlImages.length,
              itemBuilder: (context, index, realIndex) {
                final urlImage = urlImages[index];

                return buildImage(urlImage, index);
              },
              options: CarouselOptions(
                height: 200,
                //viewportFraction: 1, para aparecer um de cada vez
                //reverse: true - ficar ao contrario
                //autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                //pageSnapping: false, //que uma imagem não centralize automaticamente
                //enableInfiniteScroll: true

                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,

                onPageChanged: (index, reason) => setState(() => activeIndex = index),
              ),
            ),
            const SizedBox(height: 32),
            buildIndicator(),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: urlImages.length,
        effect: const ScrollingDotsEffect(
          dotWidth: 20,
          dotHeight: 20,
          activeDotColor: Colors.red,
          dotColor: Colors.black12,
        ),
      );

  Widget buildImage(String urlImage, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey,
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      );
}
