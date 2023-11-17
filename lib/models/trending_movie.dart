// ignore_for_file: public_member_api_docs, sort_constructors_first

class TrendingMovie {
  final String title;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final String originalTitle;
  TrendingMovie({
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.originalTitle,
  });

  factory TrendingMovie.fromJson(Map<String, dynamic> json) {
    return TrendingMovie(
        title: json['title'] ?? 'Some title',
        posterPath: json['poster_path'],
        backdropPath: json['backdrop_path'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        voteAverage: json['vote_average'],
        originalTitle: json['original_title']);
  }
  Map<String, dynamic> toJson() => {
        'title': title,
        'poster_path': posterPath,
        'backdrop_path': backdropPath,
        'overview': overview,
        'release_date': releaseDate,
        'vote_average': voteAverage,
        'original_title': originalTitle,
      };
}
