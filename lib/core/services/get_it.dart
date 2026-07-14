import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/core/utils/api_service.dart';
import 'package:movies_app/features/movies/data/data_sources/movies_remote_data_source.dart';
import 'package:movies_app/features/movies/data/repos/movies_repo_imple.dart';
import 'package:movies_app/features/movies/domain/repos/movies_repo.dart';
import 'package:movies_app/features/movies/domain/use_cases/get_now_playing_movies_use_case.dart';
import 'package:movies_app/features/movies/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:movies_app/features/movies/domain/use_cases/get_top_rated_movies_use_case.dart';
import 'package:movies_app/features/movies_details/data/data_sources/movie_details_remote_data_source.dart';
import 'package:movies_app/features/movies_details/data/repos/movie_details_repo_imple.dart';
import 'package:movies_app/features/movies_details/domain/repos/movie_details_repo.dart';
import 'package:movies_app/features/movies_details/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movies_app/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:movies_app/features/search/data/repos/search_repo_imple.dart';
import 'package:movies_app/features/search/domain/repos/search_repo.dart';
import 'package:movies_app/features/search/domain/use_cases/search_movies_use_case.dart';

GetIt getIt = GetIt.instance;

void getItInit() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiService>(ApiService(dio: getIt<Dio>()));
  getIt.registerSingleton<MoviesRemoteDataSource>(
    MoviesRemoteDataSourceImple(apiService: getIt<ApiService>()),
  );
  getIt.registerSingleton<MoviesRepo>(
    MoviesRepoImple(moviesRemoteDataSource: getIt<MoviesRemoteDataSource>()),
  );
  getIt.registerSingleton<GetPopularMoviesUseCase>(
    GetPopularMoviesUseCase(moviesRepo: getIt<MoviesRepo>()),
  );

  getIt.registerSingleton<GetTopRatedMoviesUseCase>(
    GetTopRatedMoviesUseCase(moviesRepo: getIt<MoviesRepo>()),
  );

  getIt.registerSingleton<GetNowPlayingMoviesUseCase>(
    GetNowPlayingMoviesUseCase(moviesRepo: getIt<MoviesRepo>()),
  );

  getIt.registerSingleton<MovieDetailsRemoteDataSource>(
    MovieDetailsRemoteDataSourceImple(apiService: getIt<ApiService>()),
  );
  getIt.registerSingleton<MovieDetailsRepo>(
    MovieDetailsRepoImple(
      movieDetailsRemoteDataSource: getIt<MovieDetailsRemoteDataSource>(),
    ),
  );
  getIt.registerSingleton<GetMovieDetailsUseCase>(
    GetMovieDetailsUseCase(movieDetailsRepo: getIt<MovieDetailsRepo>()),
  );

  getIt.registerSingleton<SearchRemoteDataSource>(
    SearchRemoteDataSourceImple(apiService: getIt<ApiService>()),
  );
  getIt.registerSingleton<SearchRepo>(
    SearchRepoImple(searchRemoteDataSource: getIt<SearchRemoteDataSource>()),
  );
  getIt.registerSingleton<SearchMoviesUseCase>(
    SearchMoviesUseCase(searchRepo: getIt<SearchRepo>()),
  );
}
