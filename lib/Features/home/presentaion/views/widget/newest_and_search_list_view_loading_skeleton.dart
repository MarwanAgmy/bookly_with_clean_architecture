import 'package:flutter/material.dart';

import 'book_list_view_item_loading_skeleton.dart';

class NewestAndSearchListViewLoadingSkeleton extends StatelessWidget {
  const NewestAndSearchListViewLoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItemLoadingSkeleton(),
        );
      },
    );
  }
}
