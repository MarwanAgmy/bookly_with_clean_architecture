import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';
import 'widget/custom_search_text_field.dart';
import 'widget/search_resault_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(),
          SizedBox(height: 16),
          Text('Search resault', style: Styles.textStyle18),
          SizedBox(height: 16),
          Expanded(child: SearchResaultListView()),
        ],
      ),
    );
  }
}
