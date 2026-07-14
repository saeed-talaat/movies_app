import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure/failure.dart';
import 'package:movies_app/core/use_cases/usecase.dart';
import 'package:movies_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/features/search/domain/repos/search_repo.dart';

class SearchQueryParams {
  final String query;
  final int page;

  SearchQueryParams({required this.query, this.page = 1});
}

class SearchMoviesUseCase
    extends Usecase<List<MoviesEntity>, SearchQueryParams> {
  final SearchRepo searchRepo;

  SearchMoviesUseCase({required this.searchRepo});

  @override
  Future<Either<Failure, List<MoviesEntity>>> call([
    SearchQueryParams? params,
  ]) async {
    if (params == null || params.query.isEmpty) {
      return const Right([]);
    }
    return await searchRepo.searchMovies(
      query: params.query,
      page: params.page,
    );
  }
}
