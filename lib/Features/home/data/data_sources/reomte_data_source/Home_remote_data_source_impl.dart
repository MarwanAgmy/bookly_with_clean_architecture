import 'package:bookly_app/Features/home/data/data_sources/reomte_data_source/Home_remote_data_source.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:hive/hive.dart';

import '../../../../../core/utils/functions/get_books_list.dart';
import '../../../../../core/utils/functions/save_books_data.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
      endPoint:
          'volumes?q=programming&key=AIzaSyD1Uoj4a_MoFw8aPQT6njvq5PTzAKGmSrk&filter=free-ebooks&startIndex=${pageNumber * 10}',
    );
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
      endPoint:
          'volumes?q=general&key=AIzaSyD1Uoj4a_MoFw8aPQT6njvq5PTzAKGmSrk&filter=free-ebooks&sorting=newest&startIndex=${pageNumber * 10}',
    );
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kNewestBox);
    return books;
  }
}
