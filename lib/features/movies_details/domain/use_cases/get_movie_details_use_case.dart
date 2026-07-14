import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure/failure.dart';
import 'package:movies_app/core/use_cases/usecase.dart';
import 'package:movies_app/features/movies_details/domain/entities/movie_details_entity.dart';
import 'package:movies_app/features/movies_details/domain/repos/movie_details_repo.dart';

class GetMovieDetailsUseCase extends Usecase<MovieDetailsEntity, int> {
  final MovieDetailsRepo movieDetailsRepo;

  GetMovieDetailsUseCase({required this.movieDetailsRepo});

  @override
  Future<Either<Failure, MovieDetailsEntity>> call([int movieID = 0]) async {
    return await movieDetailsRepo.getMovieDetails(movieId: movieID);
  }
}
