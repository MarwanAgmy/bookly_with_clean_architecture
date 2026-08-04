import 'package:bookly_app/Features/home/data/data_sources/local_data_source/home_local_data_source.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(kFeaturedBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
