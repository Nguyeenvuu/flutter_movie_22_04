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
        color: Color(0xFF2d3450),
        child: Column(
          children: [
            SizedBox(
              height: 7,
            ),
            Container(
              height: MediaQuery.of(context).size.width * 0.4,
              width: MediaQuery.of(context).size.width * 0.35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  image: DecorationImage(
                      image: widget.cast.profilePath != null
                          ? NetworkImage(
                              "https://image.tmdb.org/t/p/w1280${widget.cast.profilePath}",
                            )
                          : AssetImage("assets/images/default_poster.jpg"),
                      fit: BoxFit.cover),
                  color: Colors.white),
            ),
            TitleOfList("Movie of cast"),
            Expanded(
              child: FutureBuilder<Map<String, dynamic>>(
                  future: this.res_data,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Future<Movie>> list_movies;
                      list_movies =
                          bloc.loadMovies(snapshot.data['movie'].cast<int>());
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
                    return Center(
                      child: Text(
                        "${snapshot.error}",
                        //style: TextStyle(color: Colors.white),
                      ),
                    );
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
}
