import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:movies_app/features/search/presentation/views/widgets/search_result_item.dart';
import 'package:movies_app/features/search/presentation/views/widgets/search_shimmer_loading.dart';

class SearchResultList extends StatefulWidget {
  const SearchResultList({
    super.key,
    required this.movies,
    required this.query,
  });
  final List<MoviesEntity> movies;
  final String query;

  @override
  State<SearchResultList> createState() => _SearchResultListState();
}

class _SearchResultListState extends State<SearchResultList> {
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
      context
          .read<SearchCubit>()
          .searchMovies(query: widget.query, page: _pageNumber);
    }
  }

  @override
  void didUpdateWidget(covariant SearchResultList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.query != oldWidget.query) {
      _pageNumber = 1;
      _isLoading = false;
    } else if (widget.movies.length != oldWidget.movies.length) {
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
        context.watch<SearchCubit>().state is SearchPaginationLoading;
    final shimmerCount = isPaginationLoading ? 4 : 0;

    return GridView.builder(
      controller: _scrollController,
      itemCount: widget.movies.length + shimmerCount,
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, index) {
        if (index >= widget.movies.length) {
          return const SearchShimmerItem();
        }
        return SearchResultItem(movie: widget.movies[index]);
      },
    );
  }
}
