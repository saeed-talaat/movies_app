import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/get_it.dart';
import 'package:movies_app/features/search/domain/use_cases/search_movies_use_case.dart';
import 'package:movies_app/features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:movies_app/features/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(
        useCase: getIt<SearchMoviesUseCase>(),
      ),
      child: const Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}
