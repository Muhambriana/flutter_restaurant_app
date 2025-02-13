import 'package:flutter/material.dart';

class RestaurantSearchBar extends StatefulWidget {
  const RestaurantSearchBar({super.key, required this.onQueryChanged});

  final void Function(String) onQueryChanged;

  @override
  State<RestaurantSearchBar> createState() => _RestaurantSearchBarState();
}

class _RestaurantSearchBarState extends State<RestaurantSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.grey), // Search icon
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: "Search restaurants...",
                  border: InputBorder.none, // Removes underline
                ),
                onChanged: widget.onQueryChanged, // Callback on text change
              ),
            ),
            if (_controller.text.isNotEmpty)
              IconButton(
                icon: const Icon(Icons.clear, color: Colors.grey),
                onPressed: () {
                  _controller.clear();
                  widget.onQueryChanged('');
                  setState(() {}); // Refresh UI
                },
              ),
          ],
        ),
      ),
    );
  }
}


