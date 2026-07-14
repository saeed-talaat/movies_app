import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/features/search/domain/use_cases/search_movies_use_case.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchMoviesUseCase _searchMoviesUseCase;

  SearchCubit({required SearchMoviesUseCase useCase})
      : _searchMoviesUseCase = useCase,
        super(SearchInitial());

  List<MoviesEntity> searchResults = [];
  String currentQuery = '';

  Future<void> searchMovies({required String query, int page = 1}) async {
    currentQuery = query;
    if (query.isEmpty) {
      searchResults.clear();
      emit(SearchInitial());
      return;
    }

    if (page > 1) {
      emit(SearchPaginationLoading());
    } else {
      searchResults.clear();
      emit(SearchLoading());
    }

    final result = await _searchMoviesUseCase.call(
      SearchQueryParams(query: query, page: page),
    );

    result.fold(
      (failure) => emit(SearchFailure(errorMessage: failure.errorMessage)),
      (movies) {
        searchResults = [...searchResults, ...movies];
        emit(SearchSuccess(searchResults: searchResults));
      },
    );
  }
}
