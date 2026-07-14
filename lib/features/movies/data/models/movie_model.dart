import 'package:movies_app/core/utils/functions/get_genre_name_by_id.dart';
import 'package:movies_app/features/movies/domain/entities/movie_entity.dart';

class MovieModel {
  final int movieId;
  final String title;
  final double rating;
  final List<int> genres;
  final String overview;
  final String posterPath;
  final String backdropPath;

  MovieModel({
    required this.title,
    required this.rating,
    required this.genres,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.movieId,
  });

  MoviesEntity toEntity() {
    return MoviesEntity(
      movieId: movieId,
      title: title,
      rating: rating,
      genres: genres.map((e) => getGenreNameById(id: e)).toList(),
      overview: overview,
      posterUrl: posterPath,
      backdropUrl: backdropPath,
    );
  }

  factory MovieModel.fromJson({required Map<String, dynamic> json}) {
    return MovieModel(
      movieId: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      rating: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      genres: json['genre_ids'] != null
          ? List<int>.from(json['genre_ids'])
          : [],
      overview: json['overview'] as String? ?? '',
      posterPath: json['poster_path'] as String? ?? '',
      backdropPath: json['backdrop_path'] as String? ?? '',
    );
  }
}
