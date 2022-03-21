import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shoplants/data/models/user.dart';
import 'package:shoplants/data/utils/const.dart';
import 'package:shoplants/ui/styles/color_scheme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final _username = widget.user.name.split(' ')[0];
  late final _bannerCarouselController = CarouselController();

  late String _plantName;
  late String _plantAlias;
  late int _plantPrice;

  int _bannerActiveIndex = 0;

  @override
  void initState() {
    _plantName = Const.plants[0].name;
    _plantAlias = Const.plants[0].alias;
    _plantPrice = Const.plants[0].price;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // carousel banner
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              CarouselSlider.builder(
                carouselController: _bannerCarouselController,
                itemCount: Const.imgBannerUrls.length,
                itemBuilder: (context, index, realIndex) {
                  final imageUrl = Const.imgBannerUrls[index];

                  return buildBannerCarousel(imageUrl, index);
                },
                options: CarouselOptions(
                    autoPlay: true,
                    autoPlayAnimationDuration: const Duration(
                      milliseconds: 500,
                    ),
                    autoPlayInterval: const Duration(seconds: 5),
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _bannerActiveIndex = index;
                      });
                    }),
              ),
              buildBannerCarouselIndicator(),
            ],
          ),

          const SizedBox(height: 24),

          // some text (1)
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Special For You, $_username!',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Choose the ornamental plant you want.',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // carousel plant
          CarouselSlider.builder(
            itemCount: Const.plants.length ~/ 2,
            itemBuilder: (context, index, realIndex) {
              final plant = Const.plants[index];

              return buildPlantCarousel(plant.imgUrls[0], index);
            },
            options: CarouselOptions(
                aspectRatio: 1 / 1,
                enlargeCenterPage: true,
                height: 280,
                viewportFraction: 0.7,
                onPageChanged: (index, reason) {
                  setState(() {
                    _plantName = Const.plants[index].name;
                    _plantAlias = Const.plants[index].alias;
                    _plantPrice = Const.plants[index].price;
                  });
                }),
          ),

          // some text (2)
          Center(
            child: Column(
              children: [
                Text(
                  _plantName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(_plantAlias),
                Text(
                  '\$$_plantPrice',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBannerCarousel(String imageUrl, int index) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      fadeInDuration: const Duration(milliseconds: 200),
      fadeOutDuration: const Duration(milliseconds: 200),
      placeholder: (context, url) {
        return Center(
          child: SpinKitPulse(color: secondaryColor),
        );
      },
      errorWidget: (context, url, error) {
        return const Center(
          child: Icon(
            Icons.image_not_supported_outlined,
            size: 32,
          ),
        );
      },
    );
  }

  Widget buildBannerCarouselIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AnimatedSmoothIndicator(
        activeIndex: _bannerActiveIndex,
        count: Const.imgBannerUrls.length,
        effect: WormEffect(
          dotWidth: 12,
          dotHeight: 12,
          dotColor: dividerColor,
          activeDotColor: tertiaryColor,
        ),
        onDotClicked: (index) => _bannerCarouselController.animateToPage(index),
      ),
    );
  }

  Widget buildPlantCarousel(String imageUrl, int index) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 8),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: imageUrl,
            width: 280,
            height: 280,
            fit: BoxFit.fill,
            fadeInDuration: const Duration(milliseconds: 200),
            fadeOutDuration: const Duration(milliseconds: 200),
            placeholder: (context, url) {
              return Center(
                child: SpinKitPulse(color: secondaryColor),
              );
            },
            errorWidget: (context, url, error) {
              return const Center(
                child: Icon(
                  Icons.image_not_supported_outlined,
                  size: 32,
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 28,
                color: primaryTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
