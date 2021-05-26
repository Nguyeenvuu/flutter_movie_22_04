import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/blocs/HomePageBloc.dart';
import 'package:movie_app/models/Movie.dart';
import 'package:movie_app/models/User.dart';
import 'package:movie_app/ui/items/MovieItem.dart';
import 'package:movie_app/utils/Sizes.dart';

class RelatedMovie extends StatefulWidget {
  User _user;
  Movie _movie;
  RelatedMovie(this._user, this._movie);

  @override
  RelatedMovieState createState() => RelatedMovieState();
}

class RelatedMovieState extends State<RelatedMovie> {
  HomePageBloc bloc = new HomePageBloc();
  Future<Map<String, dynamic>> res_data;
  Future<List<int>> _recommended_movies;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<String> listfavorite = [];
    widget._movie.genres.forEach((element) {
      listfavorite.add(element['name'].toString());
    });
    res_data = bloc.loadRecommendedMoviesNewUser(
        widget._user.userId, listfavorite.join('|'));

    return FutureBuilder<Map<String, dynamic>>(
      future: this.res_data,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            width: double.infinity,
            height: 300,
            color: Color(0xFF2d3450),
            //Nội dung chính của ứng dụng gồm các phần như PageViewHeader và các list films
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TitleOfList("Recommend for you",
                      snapshot.data['recommendations'].cast<int>()),
                  ListMovies("recommend_for_you",
                      snapshot.data['recommendations'].cast<int>()),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              "${snapshot.error}",
              //style: TextStyle(color: Colors.white),
            ),
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  // ignore: non_constant_identifier_names
  Widget ListMovies(String listName, List<int> movies) {
    List<Future<Movie>> list_movies;
    list_movies = bloc.loadMovies(movies.sublist(0, 10));
    return Container(
      width: double.infinity,
      height: DeviceSize.getWidth() / 3 * 1.5 + 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list_movies.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: MovieItem(list_movies[index], listName),
            onTap: () async {
              bloc.movieItemSelected(
                  context, await list_movies[index], listName, widget._user);
            },
          );
        },
      ),
    );
    //}
  }

  // ignore: non_constant_identifier_names
  Widget TitleOfList(String title, List<int> movies) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10, left: 5, right: 5),
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
          ),
        ),
        GestureDetector(
          onTap: () {
            bloc.buttonMoreTap(context, title, movies, widget._user);
          },
          child: Padding(
            padding: EdgeInsets.only(top: 10, left: 5, right: 5),
            child: Row(
              children: <Widget>[
                Text(
                  "More",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
