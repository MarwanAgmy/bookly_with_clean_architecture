import 'package:bookly_app/Features/home/data/data_sources/local_data_source/home_local_data_source_impl.dart';
import 'package:bookly_app/Features/home/data/data_sources/reomte_data_source/Home_remote_data_source_impl.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_app/Features/search/domain/repos/search_repo.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../Features/search/data/data_sources/local_data_source/search_local_data_source_impl.dart';
import '../../../Features/search/data/data_sources/remote_data_source/search_remote_data_source_impl.dart';
import '../../../Features/search/data/repos/search_repo_impl.dart';
import '../../../Features/search/domain/use_cases/search_use_case.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));

  getIt.registerSingleton(
    HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        apiService: getIt.get<ApiService>(),
      ),
      homeLocalDataSource: HomeLocalDataSourceImpl(),
    ),
  );

  getIt.registerSingleton<SearchRepo>(
    SearchRepoImpl(
      searchRemoteDataSource: SearchRemoteDataSourceImpl(
        apiService: getIt.get<ApiService>(),
      ),
      searchLocalDataSource: SearchLocalDataSourceImpl(),
    ),
  );
  getIt.registerSingleton<SearchUseCase>(
    SearchUseCase(searchRepo: getIt.get<SearchRepo>()),
  );
}
