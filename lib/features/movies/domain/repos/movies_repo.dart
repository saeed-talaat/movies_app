import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure/failure.dart';
import 'package:movies_app/features/movies/domain/entities/movie_entity.dart';

abstract class MoviesRepo {
  Future<Either<Failure , List<MoviesEntity>>> getNowPlayingMovies({ int pageNumber = 1});
  Future<Either<Failure , List<MoviesEntity>>> getPopularMovies({ int pageNumber = 1});
  Future<Either<Failure , List<MoviesEntity>>> getTopRatedMovies({ int pageNumber = 1});
}