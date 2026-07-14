import 'package:movies_app/constants.dart';
import 'package:movies_app/core/utils/api_service.dart';
import 'package:movies_app/core/utils/backend_endpoint.dart';
import 'package:movies_app/features/movies_details/data/models/movie_details_model.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<MovieDetailsModel> getMovieDetails({required int movieId});
}

class MovieDetailsRemoteDataSourceImple extends MovieDetailsRemoteDataSource {
  final ApiService apiService;

  MovieDetailsRemoteDataSourceImple({required this.apiService});

  @override
  Future<MovieDetailsModel> getMovieDetails({required int movieId}) async {
    final data = await apiService.get(
      endpoint: BackendEndpoint.movieDetails(movieId),
      token: kToken,
    );
    return MovieDetailsModel.fromJson(data);
  }
}
