class AppConstance {
  static const String baseUrl = 'https://api.themoviedb.org/3/movie';
  static const String apiKey = 'b93e8a32bd90d5497277037668c70d4e';
  static const String nowPlaying = '/now_playing?api_key=$apiKey';
  static const String getPopular = '/popular?api_key=$apiKey';
  static const String topRated = '/top_rated?api_key=$apiKey';

  static const String movieDetails = '/{movie_id}?api_key=$apiKey';
  static const String emptyString = '';
  static const String token = 'send token here';
  static const int emptyInt = 0;
  static const int timeOut = 60000;
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';
}
