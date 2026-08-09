import 'package:bookly_app/Features/search/data/data_sources/local_data_source/search_local_data_source_impl.dart';
import 'package:bookly_app/Features/search/data/data_sources/remote_data_source/search_remote_data_source_impl.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo_impl.dart';
import 'package:bookly_app/Features/search/domain/repos/search_repo.dart';
import 'package:bookly_app/Features/search/domain/use_cases/search_use_case.dart';
import 'package:bookly_app/Features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/functions/setup_service_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../Features/home/domain/entities/book_entity.dart';
import '../../Features/home/presentaion/views/home_view.dart';
import '../../Features/home/presentaion/views/book_details_view.dart';
import '../../Features/search/presentation/views/search_view.dart';
import '../../Features/splash/presentaion/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) =>
            BookDetailsView(bookEntity: state.extra as BookEntity),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              SearchBooksCubit(searchUseCase: getIt.get<SearchUseCase>()),
          child: const SearchView(),
        ),
      ),
    ],
  );
}
