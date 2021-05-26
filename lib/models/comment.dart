import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class Comment extends Equatable {
  final int userId;
  final int movieId;
  final String content;
  final DateTime timeStamp;

  const Comment(
      {@required this.userId,
      @required this.movieId,
      @required this.content,
      @required this.timeStamp})
      : assert(userId != null, movieId != null);

  //   {
  //     "id": 4,
  //     "content": "This is comment OK",
  //     "timestamp": "2021-03-18",
  //     "user": 8,
  //     "movie": 16
  // },
  factory Comment.fromJson(dynamic json) {
    return Comment(
      userId: json['user'],
      movieId: json['movie'],
      content: json['content'],
      timeStamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['movieId'] = this.movieId;
    data['content'] = this.content;
    data['timeStamp'] = this.timeStamp;
    return data;
  }

  List<Object> get props => [userId, movieId, content, timeStamp];

  @override
  String toString() {
    return '''
  user_id: $userId,
  movie_id: $movieId,
  content: $content
  ''';
  }

  Comment copyWith({
    int userId,
    int movieId,
    String content,
    DateTime timeStamp,
  }) {
    return Comment(
      userId: userId ?? this.userId,
      movieId: movieId ?? this.movieId,
      content: content ?? this.content,
      timeStamp: timeStamp ?? this.timeStamp,
    );
  }

  Comment copyWithS({
    int userId,
    int movieId,
    String content,
    DateTime timeStamp,
  }) {
    return Comment(
      userId: userId ?? this.userId,
      movieId: movieId ?? this.movieId,
      content: content ?? this.content,
      timeStamp: timeStamp ?? this.timeStamp,
    );
  }
}
