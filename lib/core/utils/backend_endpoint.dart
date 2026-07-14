class BackendEndpoint {
  static const popularMovies = 'movie/popular?';
  static const topRatedMovies = 'movie/top_rated?';
  static const nowPlayingMovies = 'movie/now_playing?';
  static String movieDetails(int id) => 'movie/$id?append_to_response=credits';
  static String searchMovies(String query, {int page = 1}) =>
      'search/movie?query=${Uri.encodeComponent(query)}&page=$page';
}
