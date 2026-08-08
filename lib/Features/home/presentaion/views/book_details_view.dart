import 'package:flutter/material.dart';
import '../../domain/entities/book_entity.dart';
import 'widget/book_details_view_body.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.bookEntity});
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BookDetailsViewBody(bookEntity: bookEntity));
  }
}
