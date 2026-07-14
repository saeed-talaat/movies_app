import 'package:go_router/go_router.dart';
import 'package:movies_app/features/movies/presentation/views/movies_view.dart';
import 'package:movies_app/features/movies_details/presentation/views/movie_details_view.dart';
import 'package:movies_app/features/search/presentation/views/search_view.dart';

abstract class AppRouter {
  static const String kMoviesView = '/MoviesView';
  static const String kMovieDetailsView = '/MovieDetailsView';
  static const String kSearchView = '/SearchView';

  static final GoRouter router = GoRouter(
    initialLocation: kMoviesView,
    routes: [
      GoRoute(path: kMoviesView, builder: (context, state) => MoviesView()),
      GoRoute(
        path: '$kMovieDetailsView/:id',
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return MovieDetailsView(movieId: id);
        },
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
