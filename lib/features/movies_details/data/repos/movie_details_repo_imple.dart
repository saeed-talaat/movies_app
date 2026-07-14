import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/custom_exception/custom_exception.dart';
import 'package:movies_app/core/errors/failure/failure.dart';
import 'package:movies_app/core/errors/failure/server_failure.dart';
import 'package:movies_app/features/movies_details/data/data_sources/movie_details_remote_data_source.dart';
import 'package:movies_app/features/movies_details/domain/entities/movie_details_entity.dart';
import 'package:movies_app/features/movies_details/domain/repos/movie_details_repo.dart';

class MovieDetailsRepoImple extends MovieDetailsRepo {
  final MovieDetailsRemoteDataSource movieDetailsRemoteDataSource;

  MovieDetailsRepoImple({required this.movieDetailsRemoteDataSource});

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails({required int movieId}) async {
    try {
      final detailsModel =
          await movieDetailsRemoteDataSource.getMovieDetails(movieId: movieId);
      return right(detailsModel.toEntity());
    } on DioException catch (dio) {
      log(
        'Exception in MovieDetailsRepoImple.getMovieDetails dioException : ${dio.response?.statusCode} , ${dio.message} ',
      );
      return left(ServerFailure.fromDioError(dio));
    } catch (e) {
      log('Exception in MovieDetailsRepoImple.getMovieDetails : ${e.toString()}');
      final message =
          e is CustomException ? e.errorMessage : 'Failed Fetch Movie Details';
      return left(ServerFailure(errorMessage: message));
    }
  }
}
