import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_2/movie/blocs/events_states/movie_event.dart';
import 'package:training_2/movie/blocs/events_states/movie_state.dart';
import 'package:training_2/movie/blocs/movie_bloc.dart';

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
          if (state is MovieLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is MovieFetchSuccess) {
            return GridView.builder(
              itemCount: state.movies.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 2,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Container(
                        height: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3,
                              spreadRadius: 1,
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.network(
                              state.movies[index].poster,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 180,
                            ),
                            SizedBox(height: 20),
                            Text(
                              state.movies[index].title,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            print(state.movies[index].title);
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }
}
