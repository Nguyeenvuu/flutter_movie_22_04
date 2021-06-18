import 'package:flutter/material.dart';
import 'package:movie_app/models/User.dart';
import 'package:movie_app/utils/Sizes.dart';

class UserInfoPage extends StatelessWidget {
  User _user;

  UserInfoPage(this._user);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double fontsize = 18;
    List<dynamic> listGenres = convertGenres(_user.favorite);

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/fundo.jpg"),
                      fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(3),
                    height: DeviceSize.getWidth() / 4,
                    width: DeviceSize.getWidth() / 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'assets/images/avatar.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _user.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: fontsize,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.movie_filter,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Text(
                                "88 movies...",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fontsize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.credit_card,
                              color: Colors.yellow,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Text(
                                "VIP level",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fontsize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Color.fromRGBO(64, 67, 84, 1),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Email: " + _user.email,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: fontsize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Address: " + _user.adress,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: fontsize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.cake,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Birthday: " + _user.birthday,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: fontsize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.wc,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Gender: " + _user.gender,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: fontsize,
                                fontWeight: FontWeight.bold,
                              )),
                        )
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                          Text(
                            "  Favorite genres: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: fontsize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          createGenres(listGenres),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<dynamic> convertGenres(String genres) {
    List<dynamic> listRedult = genres.split("|");

    return listRedult;
  }

  Widget createGenres(List<dynamic> genres) {
    if (genres.length == 0) {
      return Container();
    }
    if (genres.length > 0) {
      List<Widget> someWidget = [];
      for (int i = 0; i < genres.length; i++) {
        Widget object = Padding(
          padding: EdgeInsets.only(right: 5, top: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color.fromRGBO(254, 160, 2, 1.0),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 8, right: 8),
              child: Text(
                genres[i].toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
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
}
