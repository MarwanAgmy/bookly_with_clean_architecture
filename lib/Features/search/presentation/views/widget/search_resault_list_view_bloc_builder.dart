import 'package:bookly_app/Features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
import 'search_resault_list_view.dart';

class SearchResaultListViewBlocBuilder extends StatelessWidget {
  const SearchResaultListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return SearchResaultListView(books: state.books);
        } else if (state is SearchBooksFailure) {
          return Center(
            child: Text(state.errMessage, style: Styles.textStyle18),
          );
        } else if (state is SearchBooksLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(
            child: Text(
              'Type to search for books...',
              style: Styles.textStyle18,
            ),
          );
        }
      },
    );
  }
}
