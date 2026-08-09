import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/widget/debounce.dart';
import '../../manager/search_books_cubit/search_books_cubit.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final _debounce = Debounce(delay: const Duration(milliseconds: 400));

  @override
  void dispose() {
    _debounce.dispose(); // تنظيف التايمر عند إغلاق الشاشة
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TextField(
        onChanged: (query) {
          _debounce.run(() {
            BlocProvider.of<SearchBooksCubit>(
              context,
            ).searchBooks(bookName: query);
          });
        },
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
