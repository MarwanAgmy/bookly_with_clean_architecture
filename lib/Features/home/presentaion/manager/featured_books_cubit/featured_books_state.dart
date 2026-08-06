part of 'featured_books_cubit.dart';

@immutable
sealed class FeaturedBooksState {}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksPaginationLoading extends FeaturedBooksState {}

final class FeaturedBooksFailure extends FeaturedBooksState {
  final String message;

  FeaturedBooksFailure({required this.message});
}

final class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> booksList;

  FeaturedBooksSuccess({required this.booksList});
}
