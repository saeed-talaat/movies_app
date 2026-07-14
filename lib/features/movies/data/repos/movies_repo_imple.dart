import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/failure/failure.dart';
import 'package:movies_app/core/errors/failure/server_failure.dart';
import 'package:movies_app/features/movies/data/data_sources/movies_remote_data_source.dart';
import 'package:movies_app/core/errors/custom_exception/custom_exception.dart';
import 'package:movies_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/features/movies/domain/repos/movies_repo.dart';

class MoviesRepoImple extends MoviesRepo {
  final MoviesRemoteDataSource moviesRemoteDataSource;

  MoviesRepoImple({required this.moviesRemoteDataSource});

  @override
  Future<Either<Failure, List<MoviesEntity>>> getNowPlayingMovies({int pageNumber = 1}) async {
     try {
      final moviesList = await moviesRemoteDataSource.getNowPlayingMovies(pageNumber: pageNumber);
      return right(moviesList);
    } on DioException catch (dio) {
      log(
        'Exception in MoviesRepoImple.getNowPlayingMovies dioException : ${dio.response?.statusCode} , ${dio.message} ',
      );
      return left(ServerFailure.fromDioError(dio));
    } catch (e) {
      log('Exception in MoviesRepoImple.getNowPlayingMovies : ${e.toString()}');
      final message = e is CustomException ? e.errorMessage : 'Failed Fetch Movies';
      return left(ServerFailure(errorMessage: message));
    }
    
  }

  @override
  Future<Either<Failure, List<MoviesEntity>>> getPopularMovies({int pageNumber = 1}) async {
    try {
      final moviesList = await moviesRemoteDataSource.getPopularMovies(pageNumber: pageNumber);
      return right(moviesList);
    } on DioException catch (dio) {
      log(
        'Exception in MoviesRepoImple.getPopularMovies dioException : ${dio.response?.statusCode} , ${dio.message} ',
      );
      return left(ServerFailure.fromDioError(dio));
    } catch (e) {
      log('Exception in MoviesRepoImple.getPopularMovies : ${e.toString()}');
      final message = e is CustomException ? e.errorMessage : 'Failed Fetch Movies';
      return left(ServerFailure(errorMessage: message));
    }
  }

  @override
  Future<Either<Failure, List<MoviesEntity>>> getTopRatedMovies({int pageNumber = 1}) async {
  try {
      final moviesList = await moviesRemoteDataSource.getTopRatedMovies(pageNumber: pageNumber);
      return right(moviesList);
    } on DioException catch (dio) {
      log(
        'Exception in MoviesRepoImple.getTopRatedMovies dioException : ${dio.response?.statusCode} , ${dio.message} ',
      );
      return left(ServerFailure.fromDioError(dio));
    } catch (e) {
      log('Exception in MoviesRepoImple.getTopRatedMovies : ${e.toString()}');
      final message = e is CustomException ? e.errorMessage : 'Failed Fetch Movies';
      return left(ServerFailure(errorMessage: message));
    }
  }
}
