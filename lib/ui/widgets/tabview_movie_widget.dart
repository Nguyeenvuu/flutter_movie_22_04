import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/LoginPageBloc.dart';
import 'package:movie_app/blocs/comment_bloc/comment_bloc.dart';
import 'package:movie_app/blocs/comment_bloc/comment_event.dart';
import 'package:movie_app/blocs/rating_bloc/rating_bloc.dart';
import 'package:movie_app/blocs/rating_bloc/rating_event.dart';

import 'package:movie_app/models/Movie.dart';
import 'package:movie_app/models/User.dart';
import 'package:movie_app/repositories/comment_repository_server.dart';
import 'package:movie_app/repositories/rating_repository_server.dart';

import 'package:movie_app/ui/widgets/comment_widget.dart';
import 'package:movie_app/ui/widgets/detail_widget.dart';
import 'package:movie_app/ui/widgets/rating_widget.dart';
import 'package:provider/provider.dart';

class TabViewMovie extends StatelessWidget {
  Movie movie;
  User user;
  TabViewMovie({this.movie, this.user});
  // This widget is the root of your application.
  CommentRepositoryServer repositoryComment = new CommentRepositoryServer();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: LoginPageBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: DefaultTabController(
          length: 3,
          child: SafeArea(
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(50.0),
                child: AppBar(
                  bottom: TabBar(
                    tabs: [
                      Tab(
                        text: "Detail",
                      ),
                      Tab(
                        text: "Comment",
                      ),
                      Tab(
                        text: "Rating",
                      ),
                    ],
                    labelStyle: TextStyle(fontSize: 18),
                  ),
                  backgroundColor: Color(0xFF2d3450),
                ),
              ),
              body: TabBarView(
                children: [
                  DetailWidget(
                    movie: movie,
                    user: user,
                  ),
                  BlocProvider<CommentBloc>(
                    create: (context) =>
                        CommentBloc(repository: CommentRepositoryServer())
                          ..add(
                            FetchCommentEvent(movieId: "${movie.id}"),
                          ),
                    child: CommentPage(
                      movie: movie,
                      user: user,
                    ),
                  ),
                  BlocProvider<RatingBloc>(
                    create: (context) =>
                        RatingBloc(repository: RatingRepositoryServer())
                          ..add(
                            FetchRatingEvent(movieId: "${movie.id}"),
                          ),
                    child: RatingPage(
                      movie: movie,
                      user: user,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
