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
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _debounce.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TextField(
        controller: _controller,
        textInputAction: TextInputAction.search,
        onSubmitted: (query) {
          _triggerSearch(query);
        },
        onChanged: (query) {
          setState(() {});
          _debounce.run(() => _triggerSearch(query));
        },
        decoration: InputDecoration(
          suffixIcon: _controller.text.isEmpty
              ? IconButton(
                  onPressed: () => _triggerSearch(_controller.text),
                  icon: Image.asset(AssetsData.search, fit: BoxFit.fill),
                )
              : IconButton(
                  onPressed: () {
                    _controller.clear();
                    _triggerSearch('');
                    setState(() {});
                  },
                  icon: const Icon(Icons.close, color: Colors.white),
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

  void _triggerSearch(String query) {
    if (query.trim().isNotEmpty) {
      BlocProvider.of<SearchBooksCubit>(context).searchBooks(bookName: query);
    }
  }
}
