import 'package:bookly_app/Features/home/data/data_sources/local_data_source/home_local_data_source.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  static const int pageSize = 10;

  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    final box = Hive.box<BookEntity>(kFeaturedBox);

    return box.values.skip(pageNumber * pageSize).take(pageSize).toList();
  }

  // @override
  // List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
  //   int startIndex = pageNumber * 10;
  //   int endIndex = (pageNumber + 1) * 10;
  //   var box = Hive.box<BookEntity>(kFeaturedBox);
  //   int length = box.values.length;
  //   if (startIndex >= length || endIndex > length) {
  //     return [];
  //   }
  //   return box.values.toList().sublist(startIndex, endIndex);
  // }

  @override
  List<BookEntity> fetchNewestBooks({int pageNumber = 0}) {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.skip(pageNumber * pageSize).take(pageSize).toList();
  }
}
