import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/constants.dart';
import 'package:movie_app/models/trending_movie.dart';

class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  static const _topratedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const _upcomingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';

  Future<List<TrendingMovie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      // ignore: avoid_print
      print(decodeData);
      return decodeData.map((json) => TrendingMovie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Trending movies');
    }
  }

  Future<List<TrendingMovie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topratedUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      // ignore: avoid_print
      print(decodeData);
      return decodeData.map((json) => TrendingMovie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Top Rated movies');
    }
  }

  Future<List<TrendingMovie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_upcomingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      // ignore: avoid_print
      print(decodeData);
      return decodeData.map((json) => TrendingMovie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Upcoming movies');
    }
  }
}
