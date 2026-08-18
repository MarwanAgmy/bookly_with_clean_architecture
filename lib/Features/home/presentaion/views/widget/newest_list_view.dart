import 'package:bookly_app/Features/home/presentaion/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/book_entity.dart';
import 'Book_list_view_item.dart';

class NewestListView extends StatefulWidget {
  const NewestListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<NewestListView> createState() => _NewestListViewState();
}

class _NewestListViewState extends State<NewestListView> {
  late final ScrollController _scrollController;

  bool isLoading = false;
  var nextPage = 1;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (currentScroll >= maxScroll * 0.7) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<NewestBooksCubit>(
          context,
        ).fetchNewestBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      controller: _scrollController,
      //physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.books.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(bookEntity: widget.books[index]),
        );
      },
    );
  }
}
