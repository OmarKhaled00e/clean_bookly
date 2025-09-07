import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        enabledBorder: bulidOutlineInputBorder(),
        focusedBorder: bulidOutlineInputBorder(),
        
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Opacity(
            opacity: .8,
            child: Icon(Icons.search, size: 22)),
        ),
      ),
    );
  }

  OutlineInputBorder bulidOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(12),
      );
  }
}
