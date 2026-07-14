import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure/failure.dart';
import 'package:movies_app/core/use_cases/usecase.dart';
import 'package:movies_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/features/movies/domain/repos/movies_repo.dart';

class GetPopularMoviesUseCase extends Usecase<List<MoviesEntity> , int> {
  final MoviesRepo moviesRepo;

  GetPopularMoviesUseCase({required this.moviesRepo});
  @override
  Future<Either<Failure, List<MoviesEntity>>> call([int pageNumber = 1]) async {
    return await moviesRepo.getPopularMovies(pageNumber: pageNumber);
  }
 
  
}