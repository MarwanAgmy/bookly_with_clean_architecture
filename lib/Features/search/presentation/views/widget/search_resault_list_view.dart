import 'package:flutter/material.dart';

import '../../../../home/presentaion/views/widget/best_seller_list_view_item.dart';

class SearchResaultListView extends StatelessWidget {
  const SearchResaultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(),
        );
      },
    );
  }
}
