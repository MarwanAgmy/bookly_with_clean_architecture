import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../home/domain/entities/book_entity.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit() : super(SearchBooksInitial());
}
