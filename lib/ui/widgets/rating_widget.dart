import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/MovieDetailPageBloc.dart';
import 'package:movie_app/blocs/rating_bloc/rating_bloc.dart';
import 'package:movie_app/blocs/rating_bloc/rating_event.dart';
import 'package:movie_app/blocs/rating_bloc/rating_state.dart';
import 'package:movie_app/models/Movie.dart';
import 'package:movie_app/models/User.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RatingPage extends StatefulWidget {
  final Movie movie;
  final User user;
  get movieid => this.movie.id;
  const RatingPage({Key key, this.movie, this.user}) : super(key: key);
  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  var rating = 0.0;
  RatingBloc _ratingBloc;
  @override
  void initState() {
    super.initState();
    _ratingBloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF2d3450),
      padding: EdgeInsets.only(left: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your Rating",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SmoothStarRating(
                    allowHalfRating: false,
                    onRatingChanged: (v) {
                      rating = v;
                      setState(() {
                        rating = v;
                      });
                    },
                    starCount: 5,
                    rating: rating,
                    size: 40.0,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    color: Colors.yellow,
                    borderColor: Colors.yellow,
                    spacing: 0.0),
                IconButton(
                    icon: Icon(Icons.send),
                    color: Colors.blue,
                    onPressed: () => _addRating(rating.toInt())),
                Container(
                  height: 300,
                  color: Color(0xFF2d3450),
                  child: BlocBuilder<RatingBloc, RatingState>(
                    builder: (context, state) {
                      if (state is RatingLoadingState) {
                        return Center(
                          child: Container(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      if (state is RatingLoadedState) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total ratings",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                stars(5.0, 5),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${state.sum_ratings['5']}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                stars(4.0, 5),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${state.sum_ratings['4']}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                stars(3.0, 5),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${state.sum_ratings['3']}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                stars(2.0, 5),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${state.sum_ratings['2']}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                stars(1.0, 5),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${state.sum_ratings['1']}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        );
                      }
                      return Container(
                        child: Text("No have rating"),
                      );
                    },
                  ),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget stars(double star, int count) {
    return SmoothStarRating(
        allowHalfRating: false,
        onRatingChanged: null,
        starCount: count,
        rating: star,
        size: 28.0,
        filledIconData: Icons.star,
        halfFilledIconData: Icons.star_half,
        defaultIconData: Icons.star_border,
        color: Colors.yellow,
        borderColor: Colors.yellow,
        spacing: 0.0);
  }

  void _addRating(int rt) {
    print("add");
    _ratingBloc.add(AddRatingEvent(
      movieId: widget.movie.id,
      userId: widget.user.userId,
      rating: rt,
    ));
    _ratingBloc.add(FetchRatingEvent(
      movieId: widget.movie.id.toString(),
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
