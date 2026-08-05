import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly_app/Features/home/presentaion/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentaion/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/core/utils/functions/setup_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constants.dart';
import 'core/utils/app_router.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  setupServiceLocator();
  await Hive.openBox(kFeaturedBox);
  await Hive.openBox(kNewestBox);
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturedBooksCubit(
              fetchFeaturedBooksUseCase: FetchFeaturedBooksUseCase(
                homeRepo: getIt.get<HomeRepoImpl>(),
              ),
            );
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestBooksCubit(
              fetchNewestBooksUseCase: FetchNewestBooksUseCase(
                homeRepo: getIt.get<HomeRepoImpl>(),
              ),
            );
          },
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
