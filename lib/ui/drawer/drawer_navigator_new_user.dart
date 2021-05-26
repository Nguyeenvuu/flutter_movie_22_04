import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/blocs/DrawerNavigationBloc.dart';

import 'package:movie_app/models/User.dart';
import 'package:movie_app/ui/items/DrawerItem.dart';

class DrawerNavigatorNewUser extends StatefulWidget {
  User user;

  DrawerNavigatorNewUser({this.user});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<DrawerNavigatorNewUser> {
  DrawerNavigationBloc _bloc = new DrawerNavigationBloc();

  @override
  Widget build(BuildContext context) {
    _bloc.setUser(widget.user);

    List<Widget> drawerOptions = new List<Widget>();

    for (int i = 0; i < _bloc.options.length; i++) {
      drawerOptions.add(GestureDetector(
        child: DrawerItem(_bloc.options[i]["icon"], _bloc.options[i]["title"],
            i == _bloc.indexSelected),
        onTap: () {
          setState(() {
            _bloc.onItemSelected(i);
            Navigator.of(context).pop();
          });
        },
      ));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2d3450),
        title: Center(child: Text(_bloc.options[_bloc.indexSelected]["title"])),
        actions: _bloc.indexSelected == 0
            ? <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _bloc.showSearchPage(context);
                  },
                )
              ]
            : [
                IconButton(
                  icon: Icon(null),
                )
              ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF2d3450)),
              accountName: Text("${widget.user.name}"),
              accountEmail: Text("${widget.user.email}"),
            ),
            Column(
              children: drawerOptions,
            )
          ],
        ),
      ),
      body: _bloc.getUINewUser(_bloc.indexSelected),
    );
  }
}
