import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_2/movie/blocs/events_states/movie_event.dart';
import 'package:training_2/movie/blocs/events_states/movie_state.dart';
import 'package:training_2/movie/blocs/movie_bloc.dart';
import 'package:training_2/movie/widgets/movie_item.dart';

class MovieScreen extends StatefulWidget {
  static const String path = '/movie';
  static const String name = 'movie';

  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  late MovieBloc _movieBloc;

  @override
  void initState() {
    _movieBloc = BlocProvider.of(context);
    _movieBloc.add(MovieFetch());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          return GridView.builder(
            itemCount: state is MovieFetchSuccess ? state.movies.length : 1,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              if (state is MovieFetchSuccess) {
                return MovieItem(movie: state.movies[index]);
              }

              return MovieItem.loading();
            },
          );
        },
      ),
    );
  }
}
