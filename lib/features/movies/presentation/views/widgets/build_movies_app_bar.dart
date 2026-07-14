import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/app_router.dart';
import 'package:movies_app/core/utils/app_styles.dart';

AppBar buildMoviesAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    title: Text('CineVault', style: AppStyles.bold22),
    actions: [
      IconButton(
        onPressed: () {
          context.push(AppRouter.kSearchView);
        },
        icon: const Icon(Icons.search_rounded, color: Colors.white),
      ),
    ],
  );
}

