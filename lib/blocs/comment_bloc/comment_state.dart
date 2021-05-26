import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/models/comment.dart';

abstract class CommentState extends Equatable {}

class CommentInitialState extends CommentState {
  @override
  List<Object> get props => [];
}

class CommentLoadingState extends CommentState {
  @override
  List<Object> get props => [];
}

class CommentLoadedState extends CommentState {
  final List<Comment> comments;
  CommentLoadedState({@required this.comments});
  get commentList => comments;

  @override
  List<Object> get props => null;
}

class CommentErrorState extends CommentState {
  final String message;
  CommentErrorState({@required this.message});
  @override
  List<Object> get props => null;
}
