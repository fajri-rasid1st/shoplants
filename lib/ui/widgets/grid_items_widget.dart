import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shoplants/data/models/plant.dart';
import 'package:shoplants/ui/screens/detail_screen.dart';
import 'package:shoplants/ui/styles/color_scheme.dart';

class GridItemsWidget extends StatelessWidget {
  final List<Plant> plants;
  final int gridCount;

  const GridItemsWidget({
    Key? key,
    required this.plants,
    required this.gridCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shrinkWrap: true,
      crossAxisCount: gridCount,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 0.6,
      children: plants.map((plant) {
        return Card(
          margin: const EdgeInsets.all(0),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: Colors.white,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(plant: plant),
                ),
              );
            },
            child: Wrap(
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: CachedNetworkImage(
                        imageUrl: plant.imgUrls[0],
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
                            child: Icon(Icons.image_not_supported_outlined),
                          );
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border_outlined),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(plant.name),
                      Text(
                        '\$${plant.price}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
