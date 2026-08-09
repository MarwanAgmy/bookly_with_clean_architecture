part of 'search_books_cubit.dart';

@immutable
sealed class SearchBooksState {}

final class SearchBooksInitial extends SearchBooksState {}

class SearchLoading extends SearchBooksState {}

class SearchBooksSuccess extends SearchBooksState {
  final List<BookEntity> books;

  SearchBooksSuccess(this.books);
}

class SearchBooksFailure extends SearchBooksState {
  final String errMessage;

  SearchBooksFailure(this.errMessage);
}
