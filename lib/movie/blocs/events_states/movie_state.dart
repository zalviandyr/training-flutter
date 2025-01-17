import 'package:equatable/equatable.dart';
import 'package:training_2/core/models/movie.dart';

abstract class MovieState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieUninitialized extends MovieState {}

class MovieLoading extends MovieState {}

class MovieError extends MovieState {}

class MovieFetchSuccess extends MovieState {
  final List<Movie> movies;
  final int nextPage;

  MovieFetchSuccess({required this.movies, required this.nextPage});

  @override
  List<Object?> get props => [movies, nextPage];
}
