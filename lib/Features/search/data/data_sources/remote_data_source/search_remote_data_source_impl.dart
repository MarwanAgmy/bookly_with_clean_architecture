import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/search/data/data_sources/remote_data_source/search_remote_data_source.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/functions/save_books_data.dart';

import '../../../../../core/utils/functions/get_books_list.dart';

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> searchRemoteDataSource({
    required String bookName,
  }) async {
    var data = await apiService.get(
      endPoint:
          'volumes?q=$bookName&key=AIzaSyD1Uoj4a_MoFw8aPQT6njvq5PTzAKGmSrk&filter=free-ebooks',
    );
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kSearchBox);
    return books;
  }
}
