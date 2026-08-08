import 'package:bookly_app/Features/home/presentaion/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/functions/build_error_snack_bar.dart';
import '../../../domain/entities/book_entity.dart';
import 'best_seller_list_view.dart';
import 'featured_books_list_view_loading_indicator .dart';

class BestSellerListViewBlocBuilder extends StatefulWidget {
  const BestSellerListViewBlocBuilder({super.key});

  @override
  State<BestSellerListViewBlocBuilder> createState() =>
      _BestSellerListViewBlocBuilderState();
}

class _BestSellerListViewBlocBuilderState
    extends State<BestSellerListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (BuildContext context, NewestBooksState state) {
        if (state is NewestBooksSuccess) {
          books.addAll(state.booksList);
        }
        if (state is NewestBooksPaginationFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(buildErrorSnackBar(state.errMessage));
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess ||
            state is NewestBooksPaginationFailure ||
            state is NewestBooksPaginationLoading) {
          return BestSellerListView(books: books);
        } else if (state is NewestBooksFailure) {
          return Text(state.errMessage);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
