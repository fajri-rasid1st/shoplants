import 'package:flutter/material.dart';
import 'package:shoplants/ui/styles/color_scheme.dart';

class FavoriteButtonWidget extends StatefulWidget {
  const FavoriteButtonWidget({Key? key}) : super(key: key);

  @override
  _FavoriteButtonWidgetState createState() => _FavoriteButtonWidgetState();
}

class _FavoriteButtonWidgetState extends State<FavoriteButtonWidget> {
  final String _favoriteAdded = 'Liked.';
  final String _favoriteRemoved = 'Unliked.';

  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _isFavorite = !_isFavorite;
        });

        SnackBar snackBar = SnackBar(
          content: Text(_isFavorite ? _favoriteAdded : _favoriteRemoved),
          duration: const Duration(seconds: 3),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      },
      icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
      color: _isFavorite ? dangerColor : Colors.white,
      tooltip: 'Favorite',
    );
  }
}
