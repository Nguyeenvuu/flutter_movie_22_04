import 'package:flutter/material.dart';
import 'package:movie_app/blocs/HomePageBloc.dart';
import 'package:movie_app/models/Movie.dart';
import 'package:movie_app/models/User.dart';
import 'package:movie_app/repositories/cast_and_crew_repository.dart';
import 'package:movie_app/ui/widgets/related_movie_widget.dart';
import 'package:movie_app/ui/widgets/tabview_movie_widget.dart';
import 'package:movie_app/utils/Sizes.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieDetailPage extends StatefulWidget {
  Movie _movie;
  String _listName;
  User _user;

  MovieDetailPage(this._movie, this._listName, this._user);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  HomePageBloc bloc = new HomePageBloc();
  Future<Map<String, dynamic>> res_data;
  Future<List<int>> _recommended_movies;

  String _base_url = "https://image.tmdb.org/t/p/";
  double _backdrop_width = DeviceSize.getWidth();
  double _poster_width = DeviceSize.getWidth() / 4;

  // MovieDetailPageBloc bloc = new MovieDetailPageBloc();

  TabController tabController;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final double sizeTextHeader = 14;
    CastAndCrewRepository _castrepository = new CastAndCrewRepository();
    print("DetailPage: build Function!");
    res_data = bloc.loadRecommendedMoviesNewUser(
        widget._user.userId, widget._user.favorite);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(null),
            onPressed: () {},
          )
        ],
        backgroundColor: Color(0xFF2d3450),
        title: Center(
          child: Text(
            "Movie Detail",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xFF2d3450),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: (_backdrop_width / 1.75) + (_poster_width * 1.5 / 2.1),
                child: Stack(
                  alignment: Alignment(-1, 1),
                  children: <Widget>[
                    Align(
                      alignment: Alignment(-1, -1),
                      child: this.widget._movie.backdropPath != null
                          ? Image.network(
                              _base_url +
                                  "w500" +
                                  this.widget._movie.backdropPath,
                              width: _backdrop_width,
                              height: _backdrop_width / 1.78,
                            )
                          : Image.asset("assets/images/backdrop_default.PNG"),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 80),
                      child: GestureDetector(
                        onTap: () async {
                          print("tap play movie");
                          Navigator.of(context).pushNamed("/videoTrailer",
                              arguments: widget._movie.id);
                        },
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.play_circle_outline,
                                color: Colors.yellow,
                                size: 55,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Color(0xFF2d3447),
                                blurRadius: 25,
                                offset: Offset(0, 10))
                          ]),
                          child: Hero(
                            tag: this.widget._movie.id.toString() +
                                "_" +
                                this.widget._listName,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: this.widget._movie.posterPath != null
                                  ? Image.network(
                                      _base_url +
                                          "w300" +
                                          this.widget._movie.posterPath,
                                      width: _poster_width,
                                      height: _poster_width * 1.5,
                                    )
                                  : Image.asset(
                                      "assets/images/default_poster.jpg",
                                      width: _poster_width,
                                      height: _poster_width * 1.5,
                                    ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          width: _backdrop_width * (1 - 1 / 4) - 20,
                          height: _poster_width * 1.5 / 1.9,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(bottom: 5),
                                  child: Text(this.widget._movie.title,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "${this.widget._movie.voteAverage / 2}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    RatingBar.builder(
                                      initialRating:
                                          this.widget._movie.voteAverage / 2,
                                      ignoreGestures: true,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemSize: 30.0,
                                      itemCount: 5,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 10,
                                      ),
                                      onRatingUpdate: (_) {},
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    height: 500,
                    width: double.infinity,
                    child: TabViewMovie(
                      movie: widget._movie,
                      user: widget._user,
                    ),
                  ),
                ],
              ),
              RelatedMovie(widget._user, widget._movie),
            ],
          ),
        ),
      ),
    );
  }

  String convertString(dynamic genres) {
    String result = "";
    int dem = 0;
    for (var i in genres) {
      if (dem == 0) {
        result += " " + i['name'];
      } else {
        result += ", " + i['name'];
      }
      dem++;
    }
    return result + ".";
  }

  Widget createRichText(String title, String detail) {
    return RichText(
      text: TextSpan(
          style: TextStyle(color: Colors.white, fontSize: 16),
          children: [
            TextSpan(
                text: title, style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: detail)
          ]),
    );
  }
}
