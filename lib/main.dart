import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/app.dart';
import 'package:movies_app/core/services/get_it.dart';
import 'package:movies_app/core/utils/simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MoviesApp());
  getItInit();
}

