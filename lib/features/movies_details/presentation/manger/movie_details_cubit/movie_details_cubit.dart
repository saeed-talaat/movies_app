import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/movies_details/domain/entities/movie_details_entity.dart';
import 'package:movies_app/features/movies_details/domain/use_cases/get_movie_details_use_case.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;

  MovieDetailsCubit({required GetMovieDetailsUseCase useCase})
      : _getMovieDetailsUseCase = useCase,
        super(MovieDetailsInitial());

  Future<void> getMovieDetails({required int movieId}) async {
    emit(MovieDetailsLoading());
    final result = await _getMovieDetailsUseCase.call(movieId);
    result.fold(
      (failure) => emit(MovieDetailsFailure(errorMessage: failure.errorMessage)),
      (details) => emit(MovieDetailsSuccess(movieDetails: details)),
    );
  }
}
