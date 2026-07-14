part of 'movies_cubit.dart';

abstract class MoviesState {}

final class MoviesInitial extends MoviesState {}
final class MoviesLoading extends MoviesState {}
final class MoviesSuccess extends MoviesState {}
final class PaginationLoading extends MoviesState {}
final class MoviesFailure extends MoviesState {
  final String errorMessage;

  MoviesFailure({required this.errorMessage});
}

