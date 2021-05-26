import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/cast_and_crew_bloc/cast_bloc.dart';
import 'package:movie_app/blocs/cast_and_crew_bloc/cast_event.dart';
import 'package:movie_app/blocs/cast_and_crew_bloc/cast_state.dart';
import 'package:movie_app/ui/items/cast_crew_widget.dart';
import 'package:movie_app/models/Movie.dart';
import 'package:movie_app/repositories/cast_and_crew_repository.dart';

class DetailWidget extends StatefulWidget {
  Movie movie;
  DetailWidget({this.movie});
  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  final double sizeTextHeader = 14;
  CastAndCrewRepository _castrepository = new CastAndCrewRepository();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
                          print(state.casts);
                          return CastScreen(state.casts);
                        } else if (state is CastErrorState) {
                          return Center(child: Text("Feild to load !"));
                        }
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text("data")],
        ),
      ))
    ]);
  }
}
