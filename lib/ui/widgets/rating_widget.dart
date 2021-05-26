import 'package:flutter/material.dart';

class RatingPage extends StatefulWidget {
  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  @override
  void initState() {
    super.initState();
  }

  bool rating;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF2d3450),
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ratings",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          rating == false ? Text("No have rating") : Text("Rating"),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
