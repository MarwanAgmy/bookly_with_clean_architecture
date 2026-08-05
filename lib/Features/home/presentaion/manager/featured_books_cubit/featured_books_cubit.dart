import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit({required this.fetchNewestBooksUseCase})
    : super(FeaturedBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await fetchNewestBooksUseCase.call();
    result.fold(
      (failure) {
        emit(FeaturedBooksFailure(message: failure.message));
      },
      (booksList) {
        emit(FeaturedBooksSuccess(booksList: booksList));
      },
    );
  }
}
