import 'package:movies_app/constants.dart';
import 'package:movies_app/core/utils/api_service.dart';
import 'package:movies_app/core/utils/backend_endpoint.dart';
import 'package:movies_app/features/movies/data/models/movie_model.dart';
import 'package:movies_app/features/movies/domain/entities/movie_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<MoviesEntity>> searchMovies({
    required String query,
    int page = 1,
  });
}

class SearchRemoteDataSourceImple extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImple({required this.apiService});

  @override
  Future<List<MoviesEntity>> searchMovies({
    required String query,
    int page = 1,
  }) async {
    final data = await apiService.get(
      endpoint: BackendEndpoint.searchMovies(query, page: page),
      token: kToken,
    );
    final List<MoviesEntity> movies = [];
    if (data['results'] != null) {
      for (var movie in data['results']) {
        movies.add(MovieModel.fromJson(json: movie).toEntity());
      }
    }
    return movies;
  }
}
