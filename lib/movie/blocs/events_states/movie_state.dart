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

  MovieFetchSuccess({required this.movies});

  @override
  List<Object?> get props => [movies];
}
