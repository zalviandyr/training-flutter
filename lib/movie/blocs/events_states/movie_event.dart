import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieFetch extends MovieEvent {
  final int page;

  MovieFetch({required this.page});

  @override
  List<Object?> get props => [page];
}
