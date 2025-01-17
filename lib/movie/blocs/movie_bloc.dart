import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_2/core/models/movie.dart';
import 'package:training_2/core/services/movie_service.dart';
import 'package:training_2/movie/blocs/events_states/movie_event.dart';
import 'package:training_2/movie/blocs/events_states/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieUninitialized()) {
    on(_onFetch);
  }

  Future<void> _onFetch(MovieFetch event, Emitter<MovieState> emit) async {
    try {
      emit(MovieLoading());

      List<Movie> movies = await MovieService.getPopular();

      emit(MovieFetchSuccess(movies: movies));
    } catch (e, trace) {
      onError(e, trace);

      emit(MovieError());
    }
  }
}
