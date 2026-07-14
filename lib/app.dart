import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_router.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xff141414)
      ),
      routerConfig: AppRouter.router,
    );
  }
}