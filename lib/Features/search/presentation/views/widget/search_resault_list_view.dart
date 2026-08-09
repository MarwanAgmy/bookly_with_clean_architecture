import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import '../../../../home/presentaion/views/widget/best_seller_list_view_item.dart';

class SearchResaultListView extends StatelessWidget {
  const SearchResaultListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: books.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(bookEntity: books[index]),
        );
      },
    );
  }
}
