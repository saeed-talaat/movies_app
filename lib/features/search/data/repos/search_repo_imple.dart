import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/custom_exception/custom_exception.dart';
import 'package:movies_app/core/errors/failure/failure.dart';
import 'package:movies_app/core/errors/failure/server_failure.dart';
import 'package:movies_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:movies_app/features/search/domain/repos/search_repo.dart';

class SearchRepoImple extends SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImple({required this.searchRemoteDataSource});

  @override
  Future<Either<Failure, List<MoviesEntity>>> searchMovies({
    required String query,
    int page = 1,
  }) async {
    try {
      final moviesList = await searchRemoteDataSource.searchMovies(
        query: query,
        page: page,
      );
      return right(moviesList);
    } on DioException catch (dio) {
      log(
        'Exception in SearchRepoImple.searchMovies dioException : ${dio.response?.statusCode} , ${dio.message} ',
      );
      return left(ServerFailure.fromDioError(dio));
    } catch (e) {
      log('Exception in SearchRepoImple.searchMovies : ${e.toString()}');
      final message =
          e is CustomException ? e.errorMessage : 'Failed Fetch Search Results';
      return left(ServerFailure(errorMessage: message));
    }
  }
}
