import 'package:flutter/material.dart';

import 'package:movie_app/models/Movie.dart';

import 'package:movie_app/ui/widgets/comment_widget.dart';
import 'package:movie_app/ui/widgets/detail_widget.dart';
import 'package:movie_app/ui/widgets/rating_widget.dart';
import 'package:movie_app/ui/widgets/related_movie_widget.dart';

class TabViewMovie extends StatelessWidget {
  Movie movie;
  TabViewMovie({this.movie});
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DefaultTabController(
        length: 4,
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
                    Tab(
                      text: "Related",
                    )
                  ],
                ),
                backgroundColor: Color(0xFF2d3450),
              ),
            ),
            body: TabBarView(
              children: [
                DetailWidget(movie: movie),
                CommentPage(),
                RatingPage(),
                RelatedPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
