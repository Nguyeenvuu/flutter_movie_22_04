import 'dart:async';

class MovieDetailPageBloc {
  StreamController _ratingBarController = new StreamController();
  final int rating;
  int _value = 0;

  MovieDetailPageBloc({this.rating}) {
    _ratingBarController.sink.add(rating);
  }

  Stream get ratingBarStream => _ratingBarController.stream;

  void iconButtonPress(int value) {
    _value = value;
    _ratingBarController.sink.add(_value);
    // Gọi api, thêm hoặc sửa dữ liệu vào bảng ratings database
  }

  void dispose() {
    _ratingBarController.close();
  }
}
