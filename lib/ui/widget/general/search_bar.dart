import 'package:flutter/material.dart';

class RestaurantSearchBar extends StatefulWidget {
  const RestaurantSearchBar({super.key, required this.onQueryChanged});

  final void Function(String) onQueryChanged;

  @override
  State<RestaurantSearchBar> createState() => _RestaurantSearchBarState();
}

class _RestaurantSearchBarState extends State<RestaurantSearchBar> {
  String keyword = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Find Restaurant Name',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search_rounded),
        ),
        onChanged: widget.onQueryChanged,
      ),
    );
  }
}

