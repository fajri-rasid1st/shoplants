import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shoplants/data/models/plant.dart';
import 'package:shoplants/data/models/user.dart';
import 'package:shoplants/data/utils/const.dart';
import 'package:shoplants/ui/screens/detail_screen.dart';
import 'package:shoplants/ui/styles/color_scheme.dart';
import 'package:shoplants/ui/styles/text_style.dart';
import 'package:shoplants/ui/widgets/grid_items_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // initialize variable
  final _plantCarousel = Const.plants.sublist(0, 8);
  final _plantList = Const.plants.sublist(8);
  final _bannerUrls = Const.imgBannerUrls;

  // controller
  final _bannerCarouselController = CarouselController();
  final _plantCarouselController = CarouselController();

  // late initialize name
  late final _username = widget.user.name.split(' ')[0];

  // declaration variable
  late String _plantName;
  late String _plantAlias;
  late int _plantPrice;

  // initialize current index of banner carousel
  int _bannerActiveIndex = 0;
  int _plantActiveIndex = 0;

  @override
  void initState() {
    _plantName = _plantCarousel[0].name;
    _plantAlias = _plantCarousel[0].alias;
    _plantPrice = _plantCarousel[0].price;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 36),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              CarouselSlider.builder(
                carouselController: _bannerCarouselController,
                itemCount: _bannerUrls.length,
                itemBuilder: (context, index, realIndex) {
                  return buildBannerCarousel(_bannerUrls[index], index);
                },
                options: CarouselOptions(
                    autoPlay: true,
                    autoPlayAnimationDuration: const Duration(
                      milliseconds: 500,
                    ),
                    autoPlayInterval: const Duration(seconds: 5),
                    height: kIsWeb ? 400 : null,
                    viewportFraction: kIsWeb ? 0.4 : 1,
                    enlargeCenterPage: kIsWeb ? true : false,
                    onPageChanged: (index, reason) {
                      setState(() => _bannerActiveIndex = index);
                    }),
              ),
              buildCarouselIndicator(
                activeIndex: _bannerActiveIndex,
                count: _bannerUrls.length,
                controller: _bannerCarouselController,
              )
            ],
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Special For You, $_username.',
                  style: defaultHeader2,
                ),
                const Text(
                  'Choose the ornamental plant you want.',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          CarouselSlider.builder(
            carouselController: _plantCarouselController,
            itemCount: _plantCarousel.length,
            itemBuilder: (context, index, realIndex) {
              return buildPlantCarousel(_plantCarousel[index], index);
            },
            options: CarouselOptions(
                aspectRatio: 1 / 1,
                autoPlay: kIsWeb ? true : false,
                enlargeCenterPage: true,
                height: 280,
                viewportFraction: 0.7,
                onPageChanged: (index, reason) {
                  setState(() {
                    _plantActiveIndex = index;
                    _plantName = _plantCarousel[index].name;
                    _plantAlias = _plantCarousel[index].alias;
                    _plantPrice = _plantCarousel[index].price;
                  });
                }),
          ),
          Center(
            child: Column(
              children: [
                Text(
                  _plantName,
                  style: defaultHeader2,
                ),
                Text(_plantAlias),
                Text(
                  '\$$_plantPrice',
                  style: secondaryHeader1,
                ),
              ],
            ),
          ),
          if (kIsWeb) ...[
            Center(
              child: buildCarouselIndicator(
                activeIndex: _plantActiveIndex,
                count: _plantCarousel.length,
                controller: _plantCarouselController,
              ),
            )
          ],
          const SizedBox(height: 16),
          Divider(height: 4, thickness: 4, color: dividerColor),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Most Sales This Week',
              style: defaultHeader2,
            ),
          ),
          LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth <= 768) {
              return GridItemsWidget(
                plants: _plantList,
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                crossAxisCount: 2,
              );
            } else if (constraints.maxWidth <= 1200) {
              return GridItemsWidget(
                plants: _plantList,
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                crossAxisCount: 4,
              );
            }

            return GridItemsWidget(
              plants: _plantList,
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              crossAxisCount: 6,
            );
          })
        ],
      ),
    );
  }

  CachedNetworkImage buildBannerCarousel(String imageUrl, int index) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: kIsWeb ? BoxFit.fitWidth : BoxFit.cover,
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

  GestureDetector buildPlantCarousel(Plant plant, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(plant: plant),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: CachedNetworkImage(
          imageUrl: plant.imgUrls[1],
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
      ),
    );
  }

  Padding buildCarouselIndicator({
    required int activeIndex,
    required int count,
    required CarouselController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: count,
        effect: WormEffect(
          dotWidth: 10,
          dotHeight: 10,
          dotColor: dividerColor,
          activeDotColor: tertiaryColor,
        ),
        onDotClicked: (index) => controller.animateToPage(index),
      ),
    );
  }
}
