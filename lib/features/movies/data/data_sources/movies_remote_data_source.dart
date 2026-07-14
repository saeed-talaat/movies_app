import 'package:movies_app/constants.dart';
import 'package:movies_app/core/utils/api_service.dart';
import 'package:movies_app/core/utils/backend_endpoint.dart';
import 'package:movies_app/features/movies/data/models/movie_model.dart';
import 'package:movies_app/features/movies/domain/entities/movie_entity.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MoviesEntity>> getPopularMovies({int pageNumber = 1});
  Future<List<MoviesEntity>> getTopRatedMovies({int pageNumber = 1});
  Future<List<MoviesEntity>> getNowPlayingMovies({int pageNumber = 1});
}

class MoviesRemoteDataSourceImple extends MoviesRemoteDataSource {
  final ApiService apiService;

  MoviesRemoteDataSourceImple({required this.apiService});

  @override
  Future<List<MoviesEntity>> getPopularMovies({int pageNumber = 1}) async {
    final data = await apiService.get(
      endpoint: '${BackendEndpoint.popularMovies}&page=$pageNumber',
      token: kToken,
    );
    List<MoviesEntity> movies = getMovies(data);
    return movies;
  }

  @override
  Future<List<MoviesEntity>> getTopRatedMovies({int pageNumber = 1}) async {
    final data = await apiService.get(
      endpoint: '${BackendEndpoint.topRatedMovies}&page=$pageNumber',
      token: kToken,
    );
    List<MoviesEntity> movies = getMovies(data);
    return movies;
  }

  @override
  Future<List<MoviesEntity>> getNowPlayingMovies({int pageNumber = 1}) async {
    final data = await apiService.get(
      endpoint: '${BackendEndpoint.nowPlayingMovies}&page=$pageNumber',
      token: kToken,
    );
    List<MoviesEntity> movies = getMovies(data);
    return movies;
  }

  List<MoviesEntity> getMovies(Map<String, dynamic> data) {
    List<MoviesEntity> movies = [];

    if (data['results'] != null) {
      for (var movie in data['results']) {
        movies.add(MovieModel.fromJson(json: movie).toEntity());
      }
    }
    return movies;
  }
}