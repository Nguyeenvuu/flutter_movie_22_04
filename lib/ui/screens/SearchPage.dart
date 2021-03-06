import 'package:flutter/material.dart';
import 'package:movie_app/blocs/LoginPageBloc.dart';
import 'package:movie_app/blocs/SearchPageBloc.dart';
import 'package:movie_app/models/Movie.dart';
import 'package:movie_app/models/User.dart';
import 'package:movie_app/ui/items/MovieItem.dart';
import 'package:provider/provider.dart';

class SearchPage extends SearchDelegate {
  SearchPageBloc _bloc = new SearchPageBloc();
  final User user;

  SearchPage({this.user});
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    // User user = Provider.of<LoginPageBloc>(context, listen: false).user;
    // print(user.name);
    if (query.length < 3) {
      return Container(
        color: Color(0xFF2d3450),
        child: Center(
          child: Text(
            'Search term must be longer than two letters.',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      );
    }
    Future<List<int>> listMovieId = _bloc.searchMovies(query);
    return Container(
      color: Color(0xFF2d3450),
      child: FutureBuilder(
        future: listMovieId,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data.length == 0) {
            return Center(
              child: Text(
                'No Results Found.',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            );
          } else {
            List<Future<Movie>> movies = _bloc.loadMovies(snapshot.data);
            return ListView.builder(
              cacheExtent: 0.0,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: MovieItemForMore(movies[index], "more_page"),
                  onTap: () async {
                    _bloc.movieItemSelected(
                        context, await movies[index], "more_page", user);
                  },
                );
              },
            );
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // User user = Provider.of<LoginPageBloc>(context, listen: false).user;
    // TODO: implement buildSuggestions
    List<Future<Movie>> movies = _bloc.loadMovies([299534, 68721]);
    return Container(
      color: Color(0xFF2d3450),
      child: ListView.builder(
        cacheExtent: 0.0,
        itemCount: 2,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: MovieItemForMore(movies[index], "more_page"),
            onTap: () async {
              _bloc.movieItemSelected(
                  context, await movies[index], "more_page", user);
            },
          );
        },
      ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: Color(0xFF2d3450),
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.white),
      textTheme: theme.textTheme
          .apply(bodyColor: Colors.white, displayColor: Colors.white),
    );
  }
}
