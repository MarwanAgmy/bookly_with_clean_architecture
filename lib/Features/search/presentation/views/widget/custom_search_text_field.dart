import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Image.asset(AssetsData.search, fit: BoxFit.fill),
          ),
          hintText: 'search',
          border: bulidOutlineInputBorder(),
          focusedBorder: bulidOutlineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder bulidOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
