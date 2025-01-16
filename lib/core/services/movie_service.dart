import 'package:dio/dio.dart';
import 'package:training_2/core/models/movie.dart';

class MovieService {
  static Dio _client() {
    Dio client = Dio();
    client.options.baseUrl = 'https://api.themoviedb.org';
    client.options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NTkxZWI2MzUzYjVhZmM0ODJiM2NkNjVlM2U3ZmY0YiIsIm5iZiI6MTU5OTY5NjExNi4wNDE5OTk4LCJzdWIiOiI1ZjU5NmNmNDA3OWE5NzAwMzdiNGMzZTkiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.iQ8yrecD1UY_X8s_aTyRXl3utCqQ_8nApjqow4OB-ic';

    return client;
  }

  static Future<List<Movie>> getPopular() async {
    var response = await _client().get(
      '/3/movie/popular',
      queryParameters: {'page': 1},
    );

    var results = response.data['results'];

    return (results as List).map((e) => Movie.fromJson(e)).toList();
  }
}
