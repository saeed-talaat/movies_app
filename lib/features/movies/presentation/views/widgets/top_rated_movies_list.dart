import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/features/movies/presentation/manger/movies_cubit/movies_cubit.dart';
import 'package:movies_app/features/movies/presentation/views/widgets/movie_card.dart';
import 'package:movies_app/features/movies/presentation/views/widgets/movies_shimmer_loading.dart';

class TopRatedMoviesList extends StatefulWidget {
  const TopRatedMoviesList({super.key, required this.movies});
  final List<MoviesEntity> movies;

  @override
  State<TopRatedMoviesList> createState() => _TopRatedMoviesListState();
}

class _TopRatedMoviesListState extends State<TopRatedMoviesList> {
  late final ScrollController _scrollController;
  int _pageNumber = 1;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isLoading || _pageNumber >= 500) return;

    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      _isLoading = true;
      _pageNumber++;
      context.read<MoviesCubit>().getTopRatedMovies(pageNumber: _pageNumber);
    }
  }

  @override
  void didUpdateWidget(covariant TopRatedMoviesList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.movies.length != oldWidget.movies.length) {
      _isLoading = false;
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPaginationLoading =
        context.watch<MoviesCubit>().state is PaginationLoading;
    final shimmerCount = isPaginationLoading ? 3 : 0;

    return ListView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: widget.movies.length + shimmerCount,
      itemBuilder: (context, index) {
        if (index >= widget.movies.length) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: MovieCardShimmer(),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: MovieCard(moviesEntity: widget.movies[index]),
        );
      },
    );
  }
}