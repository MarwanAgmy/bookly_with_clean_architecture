import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

abstract class HomeRepo {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}
