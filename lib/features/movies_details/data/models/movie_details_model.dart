import 'package:movies_app/features/movies_details/domain/entities/movie_details_entity.dart';

class MovieDetailsModel {
  final int id;
  final String title;
  final double voteAverage;
  final List<String> genres;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final int runtime;
  final String releaseDate;
  final List<CastModel> cast;

  MovieDetailsModel({
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.genres,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.runtime,
    required this.releaseDate,
    required this.cast,
  });

  MovieDetailsEntity toEntity() {
    return MovieDetailsEntity(
      movieId: id,
      title: title,
      rating: voteAverage,
      genres: genres,
      overview: overview,
      posterUrl: posterPath,
      backdropUrl: backdropPath,
      runtime: runtime,
      releaseDate: releaseDate,
      cast: cast.map((e) => e.toEntity()).toList(),
    );
  }

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    final genreList = <String>[];
    if (json['genres'] != null) {
      for (var genre in json['genres']) {
        if (genre['name'] != null) {
          genreList.add(genre['name'] as String);
        }
      }
    }
    final castList = <CastModel>[];
    if (json['credits'] != null && json['credits']['cast'] != null) {
      for (var actor in json['credits']['cast']) {
        castList.add(CastModel.fromJson(actor));
      }
    }
    return MovieDetailsModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      genres: genreList,
      overview: json['overview'] as String? ?? '',
      posterPath: json['poster_path'] as String? ?? '',
      backdropPath: json['backdrop_path'] as String? ?? '',
      runtime: json['runtime'] as int? ?? 0,
      releaseDate: json['release_date'] as String? ?? '',
      cast: castList,
    );
  }
}

class CastModel {
  final String name;
  final String profilePath;
  CastModel({required this.name, required this.profilePath});
  CastEntity toEntity() => CastEntity(name: name, profileUrl: profilePath);
  factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
        name: json['name'] as String? ?? '',
        profilePath: json['profile_path'] as String? ?? '',
      );
}
