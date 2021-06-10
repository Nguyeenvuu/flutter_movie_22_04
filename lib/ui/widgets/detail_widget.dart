import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/cast_and_crew_bloc/cast_bloc.dart';
import 'package:movie_app/blocs/cast_and_crew_bloc/cast_event.dart';
import 'package:movie_app/blocs/cast_and_crew_bloc/cast_state.dart';
import 'package:movie_app/models/User.dart';

import 'package:movie_app/ui/items/cast_crew_widget.dart';
import 'package:movie_app/models/Movie.dart';
import 'package:movie_app/repositories/cast_and_crew_repository.dart';
import 'package:movie_app/ui/screens/genres_page.dart';

class DetailWidget extends StatefulWidget {
  User user;
  Movie movie;
  DetailWidget({this.movie, this.user});
  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  final double sizeTextHeader = 14;
  CastAndCrewRepository _castrepository = new CastAndCrewRepository();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color(0xFF2d3450),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 17, right: 5),
                child: Text(
                  "Actors",
                  style: TextStyle(
                    fontSize: sizeTextHeader,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: BlocProvider(
                  create: (context) => CastBloc(repository: _castrepository)
                    ..add(FetchCastAndCrewEvent(movieId: widget.movie.id)),
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: BlocBuilder<CastBloc, CastState>(
                        // ignore: missing_return
                        builder: (context, state) {
                          if (state is CastInitialState) {
                            return CircularProgressIndicator();
                          } else if (state is CastLoadingState) {
                            return CircularProgressIndicator();
                          } else if (state is CastLoadedState) {
                            return CastScreen(
                                state.casts.sublist(0, 10), widget.user);
                          } else if (state is CastErrorState) {
                            return Center(child: Text("Feild to load !"));
                          }
                          return Center(child: Text("Feild to load !"));
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 10),
            width: double.infinity,
            color: Color(0xFF2d3450),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  createGenres(widget.movie.genres),
                  createText("Released: ", "${widget.movie.releaseDate}"),
                  createText("Runtime: ",
                      "${widget.movie.runtime ~/ 60} hours ${widget.movie.runtime % 60} min"),
                  createText("Revenue: ",
                      "${widget.movie.revenue / 1000000}\$ millions"),
                  createText("Budget: ",
                      "${widget.movie.budget / 1000000}\$ millions"),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "About the Movie",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "${widget.movie.overview}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget createGenres(List<dynamic> genres) {
    if (genres.length > 0) {
      List<Widget> someWidget = [];
      for (int i = 0; i < genres.length; i++) {
        Widget object = Padding(
          padding: EdgeInsets.only(right: 5, top: 5),
          child: GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              margin: EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromRGBO(254, 160, 2, 1.0),
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                child: Text(
                  genres[i]['name'].toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onTap: () {
              print(genres[i]['name'].toString());
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => GenresPage(
                    genres: genres[i]['name'].toString(),
                    user: widget.user,
                  ),
                ),
              );
            },
          ),
        );
        someWidget.add(object);
      }

      return Wrap(
        children: someWidget,
      );
    }
    return null;
  }

  Widget createText(String text, String content) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            content,
            style: TextStyle(
              color: Colors.green,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
