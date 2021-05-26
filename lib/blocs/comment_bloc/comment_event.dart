import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CommentEvent extends Equatable {
  String get query => null;
}

// ignore: must_be_immutable
class FetchCommentEvent extends CommentEvent {
  String movieId;
  FetchCommentEvent({@required this.movieId});

  @override
  // TODO: implement props
  List<Object> get props => [query];
}

// ignore: must_be_immutable
class AddCommentEvent extends CommentEvent {
  int movieId;
  int userId;
  String content;
  AddCommentEvent({
    @required this.movieId,
    @required this.userId,
    @required this.content,
  });

  @override
  List<Object> get props => [movieId, userId, content];
}
