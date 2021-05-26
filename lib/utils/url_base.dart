const String api_key = "c96baf2da7e2bb718a017f316ac6c905";
const String baseApiOnlineUrl = "http://api.themoviedb.org/3/";
const String baseServerUrl = 'http://10.0.2.2:8000';
// const String baseServerUrl = 'http://192.168.32.26:8000';

final movieDetailOnlineUrl =
    (idMovie) => "${baseApiOnlineUrl}movie/${idMovie}?api_key=${api_key}";
final movieSearchOnlineUrl = (query) =>
    "${baseApiOnlineUrl}search/movie?api_key=${api_key}&query=${query}";

// Danh sách các Url trong server Django
const String customerLoginUrl = '$baseServerUrl/customer/login/';
const String customerRegisterUrl = '$baseServerUrl/customer/register/';
const String customerDetailUrl = '$baseServerUrl/customer/';

const String recommendationMoviesUrl = '$baseServerUrl/recommendations/';
const String recommendationMoviesNewUserUrl =
    '$baseServerUrl/recommendations/new';
const String recommendationMoviesByCastUrl =
    '$baseServerUrl/recommendations/cast';

const String commentByMovieUrl = '$baseServerUrl/comment/movie/';
const String commentByCustomerUrl = '$baseServerUrl/comment/customer/';
const String createCommentUrl = '$baseServerUrl/comment/create/';

const String ratingByUserIdUrl = '$baseServerUrl/ratings/customer/';
const String ratingByMovieIdUrl = '$baseServerUrl/ratings/movie/';
const String ratingCreateUrl = '$baseServerUrl/ratings/create/';
const String ratingUpdateUrl = '$baseServerUrl/ratings/create/';
