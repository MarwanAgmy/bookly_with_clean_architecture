import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/search/domain/use_cases/search_use_case.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:meta/meta.dart';

import '../../../../home/domain/entities/book_entity.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  final SearchUseCase searchUseCase;
  SearchBooksCubit({required this.searchUseCase}) : super(SearchBooksInitial());
  Future<void> searchBooks({required String bookName}) async {
    if (bookName.trim().isEmpty) {
      emit(SearchBooksInitial());
      return;
    }
    emit(SearchBooksLoading());
    var result = await searchUseCase.call(bookName);
    result.fold(
      (failure) {
        emit(SearchBooksFailure(failure.message));
      },
      (books) {
        emit(SearchBooksSuccess(books));
      },
    );
  }
}
