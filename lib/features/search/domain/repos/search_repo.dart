import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure/failure.dart';
import 'package:movies_app/features/movies/domain/entities/movie_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<MoviesEntity>>> searchMovies({
    required String query,
    int page = 1,
  });
}
