
class MoviesEntity {
  final int movieId;
  final String title;
  final double rating;
  final List<String> genres;
  final String overview;
  final String posterUrl;
  final String backdropUrl;

  MoviesEntity({
    required this.movieId,
    required this.title,
    required this.rating,
    required this.genres,
    required this.overview,
    required this.posterUrl,
    required this.backdropUrl,
  });
}
