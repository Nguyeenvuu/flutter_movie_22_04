import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  void initState() {
    super.initState();
  }

  Color colorwhite = Colors.white;
  Color colorbackground = Color(0xFF2d3450);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 59,
                  padding: EdgeInsets.only(left: 10),
                  color: colorbackground,
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Write comment...",
                    ),
                    cursorColor: colorwhite,
                  ),
                ),
              ),
              Container(
                color: colorbackground,
                height: 59,
                child: IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Colors.blue,
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
          Container(
            height: 400,
            color: Color(0xFF2d3450),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                ListTile(
                  leading: Icon(
                    Icons.account_circle_outlined,
                    color: colorwhite,
                  ),
                  title: Text(
                    "User name",
                    style: TextStyle(
                        color: colorwhite, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "This is comment",
                    style: TextStyle(color: colorwhite),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_circle_outlined,
                    color: colorwhite,
                  ),
                  title: Text(
                    "User name",
                    style: TextStyle(
                        color: colorwhite, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "This is comment",
                    style: TextStyle(color: colorwhite),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_circle_outlined,
                    color: colorwhite,
                  ),
                  title: Text(
                    "User name",
                    style: TextStyle(
                        color: colorwhite, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "This is comment",
                    style: TextStyle(color: colorwhite),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_circle_outlined,
                    color: colorwhite,
                  ),
                  title: Text(
                    "User name",
                    style: TextStyle(
                        color: colorwhite, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "This is comment",
                    style: TextStyle(color: colorwhite),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_circle_outlined,
                    color: colorwhite,
                  ),
                  title: Text(
                    "User name",
                    style: TextStyle(
                        color: colorwhite, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "This is comment",
                    style: TextStyle(color: colorwhite),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_circle_outlined,
                    color: colorwhite,
                  ),
                  title: Text(
                    "User name",
                    style: TextStyle(
                        color: colorwhite, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "This is comment",
                    style: TextStyle(color: colorwhite),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_circle_outlined,
                    color: colorwhite,
                  ),
                  title: Text(
                    "User name",
                    style: TextStyle(
                        color: colorwhite, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "This is comment",
                    style: TextStyle(color: colorwhite),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_circle_outlined,
                    color: colorwhite,
                  ),
                  title: Text(
                    "User name",
                    style: TextStyle(
                        color: colorwhite, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "This is comment",
                    style: TextStyle(color: colorwhite),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_circle_outlined,
                    color: colorwhite,
                  ),
                  title: Text(
                    "User name",
                    style: TextStyle(
                        color: colorwhite, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "This is comment",
                    style: TextStyle(color: colorwhite),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_circle_outlined,
                    color: colorwhite,
                  ),
                  title: Text(
                    "User name",
                    style: TextStyle(
                        color: colorwhite, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "This is comment",
                    style: TextStyle(color: colorwhite),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_circle_outlined,
                    color: colorwhite,
                  ),
                  title: Text(
                    "User name",
                    style: TextStyle(
                        color: colorwhite, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "This is comment",
                    style: TextStyle(color: colorwhite),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_circle_outlined,
                    color: colorwhite,
                  ),
                  title: Text(
                    "User name",
                    style: TextStyle(
                        color: colorwhite, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "This is comment",
                    style: TextStyle(color: colorwhite),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_circle_outlined,
                    color: colorwhite,
                  ),
                  title: Text(
                    "User name",
                    style: TextStyle(
                        color: colorwhite, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "This is comment",
                    style: TextStyle(color: colorwhite),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_circle_outlined,
                    color: colorwhite,
                  ),
                  title: Text(
                    "User name",
                    style: TextStyle(
                        color: colorwhite, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "This is comment",
                    style: TextStyle(color: colorwhite),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_circle_outlined,
                    color: colorwhite,
                  ),
                  title: Text(
                    "User name",
                    style: TextStyle(
                        color: colorwhite, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "This is comment",
                    style: TextStyle(color: colorwhite),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_circle_outlined,
                    color: colorwhite,
                  ),
                  title: Text(
                    "User name",
                    style: TextStyle(
                        color: colorwhite, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "This is comment",
                    style: TextStyle(color: colorwhite),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
