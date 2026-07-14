import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure/failure.dart';
import 'package:movies_app/features/movies_details/domain/entities/movie_details_entity.dart';

abstract class MovieDetailsRepo {
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails({required int movieId});
}
