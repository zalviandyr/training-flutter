import 'package:dio/dio.dart';
import 'package:training_2/core/app/app.dart';
import 'package:training_2/core/models/movie.dart';

class MovieService {
  static final Dio _client = App.instance.client;

  static Future<List<Movie>> getPopular(int page) async {
    var response = await _client.get(
      '/3/movie/popular',
      queryParameters: {'page': page},
    );

    var results = response.data['results'];

    return (results as List).map((e) => Movie.fromJson(e)).toList();
  }
}
