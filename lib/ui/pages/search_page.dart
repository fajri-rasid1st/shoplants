import 'package:flutter/material.dart';
import 'package:shoplants/data/models/plant.dart';
import 'package:shoplants/data/utils/const.dart';
import 'package:shoplants/ui/widgets/grid_items_widget.dart';
import 'package:shoplants/ui/widgets/search_field_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // late initialize plant list
  late List<Plant> _plantList;

  // initialize search query
  String _query = '';

  @override
  void initState() {
    _plantList = Const.plants;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        children: <Widget>[
          SearchFieldWidget(
            text: _query,
            onChanged: searchPlant,
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

  void searchPlant(String query) {
    final plants = Const.plants.where((plant) {
      final nameLower = plant.name.toLowerCase();
      final queryLower = query.toLowerCase();

      return nameLower.contains(queryLower);
    }).toList();

    setState(() {
      _query = query;
      _plantList = plants;
    });
  }
}
