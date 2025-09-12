import 'package:bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/domain/use_cases/launch_preview_book_button_use_case.dart';
import 'package:bookly/Features/search/data/data_sources/search_remote_data_source.dart';
import 'package:bookly/Features/search/data/repos/search_repo_impl.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(getIt.get<ApiService>()),
      homeLocalDataSource: HomeLocalDataSourceImpl(),
    ),
  );
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(SearchRemoteDataSourceImpl(getIt.get<ApiService>())));
  getIt.registerSingleton<LaunchPreviewBookButtonUseCase>(
    LaunchPreviewBookButtonUseCase(),
  );
}
