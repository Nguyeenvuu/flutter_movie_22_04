import 'package:flutter/material.dart';
import 'package:movie_app/blocs/HomePageBloc.dart';
import 'package:movie_app/models/Movie.dart';
import 'package:movie_app/models/User.dart';
import 'package:movie_app/models/api_cast_online.dart';
import 'package:movie_app/ui/items/MovieItem.dart';

// ignore: must_be_immutable
class ActorDetailPage extends StatefulWidget {
  final Cast cast;
  final User user;
  ActorDetailPage({Key key, this.cast, this.user}) : super(key: key);

  @override
  _ActorDetailPageState createState() => _ActorDetailPageState();
}

class _ActorDetailPageState extends State<ActorDetailPage> {
  HomePageBloc bloc = new HomePageBloc();

  Future<Map<String, dynamic>> res_data;

  Future<List<int>> _recommended_movies;

  @override
  Widget build(BuildContext context) {
    res_data = bloc.loadRecommendedMoviesByCast(widget.cast.name);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2d3450),
        title: Text("${widget.cast.name}",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white)),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xFF2d3450),
        child: FutureBuilder<Map<String, dynamic>>(
          future: this.res_data,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Future<Movie>> list_movies;
              list_movies = bloc.loadMovies(snapshot.data['movie'].cast<int>());
              return ListView.builder(
                cacheExtent: 0.0,
                itemCount: list_movies.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: MovieItemForMore(list_movies[index], "listName"),
                    onTap: () async {
                      bloc.movieItemSelected(context, await list_movies[index],
                          "listName", widget.user);
                    },
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget TitleOfList(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10, left: 10, right: 5),
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
