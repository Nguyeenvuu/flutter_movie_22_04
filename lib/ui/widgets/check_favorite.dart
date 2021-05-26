import 'package:flutter/material.dart';
import 'package:movie_app/models/genre.dart';

class CheckFavorite extends StatefulWidget {
  @override
  _CheckFavoriteState createState() => _CheckFavoriteState();
}

class _CheckFavoriteState extends State<CheckFavorite> {
  bool _checkbox = false;
  bool _checkbox2 = false;
  bool _checkboxListTile = false;
  Genre genres = new Genre(
    animation: false,
    comedy: false,
    crime: false,
    documentary: false,
    drama: false,
    adventure: false,
    fantasy: false,
    action: false,
    family: false,
    history: false,
    horror: false,
    music: false,
    mystery: false,
    romance: false,
    science_fiction: false,
    thriller: false,
    war: false,
    western: false,
  );

  String stringFavorite = "";
  @override
  void initState() {
    super.initState();
    print(stringFavorite);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0))),
      child: Center(
        child: Column(
          children: [
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text('I am true now'),
              value: genres.action,
              onChanged: (value) {
                setState(() {
                  genres.action = !genres.action;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                var list = [];
                if (genres.action == true) {
                  list.add("abc");
                }

                stringFavorite = list.toString();
                print(stringFavorite);
              },
            )
          ],
        ),
      ),
    );
  }
}
