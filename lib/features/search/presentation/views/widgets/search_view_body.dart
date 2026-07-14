import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:movies_app/features/search/presentation/views/widgets/search_input_field.dart';
import 'package:movies_app/features/search/presentation/views/widgets/search_result_list.dart';
import 'package:movies_app/features/search/presentation/views/widgets/search_shimmer_loading.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top + 8),
        Row(
          children: [
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => context.pop(),
            ),
            const Expanded(
              child: SearchInputField(),
            ),
          ],
        ),
        Expanded(
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchSuccess || state is SearchPaginationLoading) {
                return SearchResultList(
                  movies: cubit.searchResults,
                  query: cubit.currentQuery,
                );
              } else if (state is SearchLoading) {
                return const SearchShimmerLoading();
              } else if (state is SearchFailure) {
                return Center(
                  child: Text(state.errorMessage, style: AppStyles.bold24),
                );
              } else {
                return Center(
                  child: Text(
                    'Search for your favorite movies',
                    style: AppStyles.semiBold18.copyWith(color: Colors.grey),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
