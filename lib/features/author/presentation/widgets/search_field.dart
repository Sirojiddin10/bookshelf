import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback onClearTap;
  final ValueChanged<String> onChanged;

  const SearchField({super.key, this.controller, required this.onClearTap, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 1,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(),
        hintText: 'Search authors...',
        suffixIcon: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onClearTap,
          child: Padding(padding: EdgeInsets.all(16), child: Icon(Icons.cancel)),
        ),
      ),
    );
  }
}
