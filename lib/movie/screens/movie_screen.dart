import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:training_2/core/models/movie.dart';
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
  final PagingController<int, Movie> _pagingController =
      PagingController(firstPageKey: 1);
  late MovieBloc _movieBloc;

  @override
  void initState() {
    _movieBloc = BlocProvider.of(context);

    _pagingController.addPageRequestListener((page) {
      _movieBloc.add(MovieFetch(page: page));
    });

    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();

    super.dispose();
  }

  void _movieListener(BuildContext context, MovieState state) {
    if (state is MovieFetchSuccess) {
      if (state.movies.length == 20) {
        _pagingController.appendPage(state.movies, state.nextPage);
      } else {
        _pagingController.appendLastPage(state.movies);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MovieBloc, MovieState>(
      listener: _movieListener,
      child: Scaffold(
        body: PagedGridView(
          pagingController: _pagingController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 2,
          ),
          builderDelegate: PagedChildBuilderDelegate<Movie>(
            itemBuilder: (context, item, index) {
              return MovieItem(movie: item);
            },
            newPageProgressIndicatorBuilder: (context) {
              return MovieItem.loading();
            },
          ),
        ),
        // body: BlocBuilder<MovieBloc, MovieState>(
        //   builder: (context, state) {
        //     return GridView.builder(
        //       itemCount: state is MovieFetchSuccess ? state.movies.length : 1,
        //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 2,
        //         crossAxisSpacing: 5,
        //         mainAxisSpacing: 2,
        //       ),
        //       itemBuilder: (context, index) {
        //         if (state is MovieFetchSuccess) {
        //           return MovieItem(movie: state.movies[index]);
        //         }

        //         return MovieItem.loading();
        //       },
        //     );
        //   },
        // ),
      ),
    );
  }
}
