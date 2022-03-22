import 'package:flutter/material.dart';
import 'package:shoplants/ui/styles/color_scheme.dart';

class SearchFieldWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;

  const SearchFieldWidget({
    Key? key,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 1,
            spreadRadius: 0.5,
            color: dividerColor,
          ),
        ],
        color: Colors.white,
      ),
      child: TextField(
        controller: _controller,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Search Plants...",
          hintStyle: TextStyle(color: secondaryTextColor),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: InputBorder.none,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: widget.text.isEmpty
              ? const SizedBox()
              : IconButton(
                  onPressed: () {
                    _controller.clear();
                    widget.onChanged('');
                  },
                  icon: Icon(
                    Icons.close,
                    color: primaryTextColor,
                  ),
                ),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
