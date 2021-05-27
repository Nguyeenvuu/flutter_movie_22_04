import 'package:flutter/material.dart';
import 'package:movie_app/blocs/HomePageBloc.dart';
import 'package:movie_app/models/Movie.dart';
import 'package:movie_app/models/User.dart';
import 'package:movie_app/ui/items/MovieItem.dart';

// ignore: must_be_immutable
class GenresPage extends StatefulWidget {
  final String genres;
  final User user;
  GenresPage({Key key, this.genres, this.user}) : super(key: key);

  @override
  _GenresPageState createState() => _GenresPageState();
}

class _GenresPageState extends State<GenresPage> {
  HomePageBloc bloc = new HomePageBloc();

  Future<Map<String, dynamic>> res_data;

  Future<List<int>> _recommended_movies;

  @override
  Widget build(BuildContext context) {
    res_data = bloc.loadRecommendedMoviesByGenres(
      userId: widget.user.userId,
      favorites: widget.genres,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2d3450),
        title: Text("${widget.genres}",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white)),
      ),
      body: Container(
        color: Color(0xFF2d3450),
        child: Column(
          children: [
            SizedBox(
              height: 7,
            ),
            Expanded(
              child: FutureBuilder<Map<String, dynamic>>(
                  future: this.res_data,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Future<Movie>> list_movies;
                      list_movies = bloc.loadMovies(
                          snapshot.data['recommendations'].cast<int>());
                      return GridView.builder(
                        padding: const EdgeInsets.all(10.0),
                        itemCount: list_movies.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: MovieItem(list_movies[index], "listName"),
                            onTap: () async {
                              bloc.movieItemSelected(
                                  context,
                                  await list_movies[index],
                                  "listName",
                                  widget.user);
                            },
                          );
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 4 / 5,
                        ),
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
            ),
          ],
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
