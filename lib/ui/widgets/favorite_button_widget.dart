import 'package:flutter/material.dart';
import 'package:shoplants/ui/styles/color_scheme.dart';
import 'package:shoplants/ui/styles/text_style.dart';

class FavoriteButtonWidget extends StatefulWidget {
  const FavoriteButtonWidget({Key? key}) : super(key: key);

  @override
  _FavoriteButtonWidgetState createState() => _FavoriteButtonWidgetState();
}

class _FavoriteButtonWidgetState extends State<FavoriteButtonWidget> {
  final String _favoriteAdded = 'Liked';
  final String _favoriteRemoved = 'Unliked';

  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() => _isFavorite = !_isFavorite);

        SnackBar snackBar = SnackBar(
          content: Text(
            _isFavorite ? _favoriteAdded : _favoriteRemoved,
            style: snackBarTitle,
          ),
          duration: const Duration(seconds: 3),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      },
      icon: Icon(
        _isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
      ),
      color: _isFavorite ? tertiaryColor : Colors.white,
      tooltip: 'Favorite',
    );
  }
}
