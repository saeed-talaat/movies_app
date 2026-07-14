class MovieDetailsEntity {
  final int movieId;
  final String title;
  final double rating;
  final List<String> genres;
  final String overview;
  final String posterUrl;
  final String backdropUrl;
  final int runtime;
  final String releaseDate;
  final List<CastEntity> cast;

  MovieDetailsEntity({
    required this.movieId,
    required this.title,
    required this.rating,
    required this.genres,
    required this.overview,
    required this.posterUrl,
    required this.backdropUrl,
    required this.runtime,
    required this.releaseDate,
    required this.cast,
  });
}

class CastEntity {
  final String name;
  final String profileUrl;

  CastEntity({
    required this.name,
    required this.profileUrl,
  });
}
