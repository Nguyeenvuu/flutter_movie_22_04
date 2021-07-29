import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import 'package:movie_app/blocs/comment_bloc/comment_event.dart';
import 'package:movie_app/blocs/comment_bloc/comment_state.dart';
import 'package:movie_app/models/comment.dart';
import 'package:movie_app/repositories/comment_repository_server.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentRepositoryServer repository;

  CommentBloc({@required this.repository}) : super(CommentInitialState());

  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async* {
    if (event is FetchCommentEvent) {
      yield CommentLoadingState();
      try {
        List<Comment> comments =
            await repository.listCommentByMovieId(movieId: event.movieId);
        yield CommentLoadedState(comments: comments);
      } catch (e) {
        yield CommentErrorState(message: e.toString());
      }
    }
    if (event is AddCommentEvent) {
      try {
        Map<String, dynamic> res = await repository.createComment(
          userId: event.userId,
          movieId: event.movieId,
          content: event.content,
        );
        print(res);
        await Future.delayed(Duration(seconds: 2));
        List<Comment> comments =
            await repository.listCommentByMovieId(movieId: event.movieId);
        yield CommentLoadedState(comments: comments);
      } catch (error) {
        print(error);
        yield CommentErrorState(message: error.toString());
      }
    }
  }
}
