import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/features/movies/domain/use_cases/get_now_playing_movies_use_case.dart';
import 'package:movies_app/features/movies/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:movies_app/features/movies/domain/use_cases/get_top_rated_movies_use_case.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({
    required this._getPopularMoviesUseCase,
    required this._getTopRatedMoviesUseCase,
    required this._getNowPlayingMoviesUseCase,
  }) : super(MoviesInitial());

  final GetPopularMoviesUseCase _getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase _getTopRatedMoviesUseCase;
  final GetNowPlayingMoviesUseCase _getNowPlayingMoviesUseCase;

  List<MoviesEntity> popularMovies = [];
  List<MoviesEntity> topRatedMovies = [];
  MoviesEntity? nowPlayingMovies;

  Future<void> getPopularMovies({int pageNumber = 1}) async {
    if (pageNumber > 1) {
      emit(PaginationLoading());
    } else {
      emit(MoviesLoading());
    }
    final result = await _getPopularMoviesUseCase.call(pageNumber);
    result.fold(
      (failure) => emit(MoviesFailure(errorMessage: failure.errorMessage)),
      (movies) {
        popularMovies = [...popularMovies, ...movies];
        emit(MoviesSuccess());
      },
    );
  }

  Future<void> getTopRatedMovies({int pageNumber = 1}) async {
    if (pageNumber > 1) {
      emit(PaginationLoading());
    } else {
      emit(MoviesLoading());
    }
    final result = await _getTopRatedMoviesUseCase.call(pageNumber);
    result.fold(
      (failure) => emit(MoviesFailure(errorMessage: failure.errorMessage)),
      (movies) {
        topRatedMovies = [...topRatedMovies, ...movies];
        emit(MoviesSuccess());
      },
    );
  }

  Future<void> getNowPlayingMovies() async {
    emit(MoviesLoading());
    final random = Random();
    int randomPage = random.nextInt(10) + 1;
    final result = await _getNowPlayingMoviesUseCase.call(randomPage);
    result.fold(
      (failure) => emit(MoviesFailure(errorMessage: failure.errorMessage)),
      (movies) {
        int randomIndex = random.nextInt(movies.length);
        nowPlayingMovies = movies[randomIndex];
        emit(MoviesSuccess());
      },
    );
  }
}
