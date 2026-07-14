import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/features/movies/presentation/manger/movies_cubit/movies_cubit.dart';
import 'package:movies_app/features/movies/presentation/views/widgets/movies_shimmer_loading.dart';
import 'package:movies_app/features/movies/presentation/views/widgets/movies_view_body.dart';

class MoviesViewBodyBlocBuilder extends StatelessWidget {
  const MoviesViewBodyBlocBuilder({super.key});

  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        if (state is MoviesSuccess || state is PaginationLoading) {
          return MoviesViewBody();
        } else if (state is MoviesFailure) {
          return Center(
            child: Text(state.errorMessage, style: AppStyles.bold24),
          );
        } else {
          return const MoviesShimmerLoading();
        }
      },
    );
  }
}
