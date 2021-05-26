import 'package:flutter/material.dart';
import 'package:movie_app/models/api_cast_online.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CastScreen extends StatelessWidget {
  final List<Cast> casts;
  CastScreen(this.casts);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, i) {
          return SizedBox(
            width: 8,
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: casts.length,
        shrinkWrap: true,
        itemBuilder: (context, i) {
          return GestureDetector(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.15,
                    width: MediaQuery.of(context).size.width * 0.15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                            image: casts[i].profilePath != null
                                ? NetworkImage(
                                    "https://image.tmdb.org/t/p/w1280${casts[i].profilePath}",
                                  )
                                : AssetImage(
                                    "assets/images/default_poster.jpg"),
                            fit: BoxFit.cover),
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                AutoSizeText(
                  casts[i].name,
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.02,
                    color: Color(0xFFfbfbfb),
                  ),
                )
              ],
            ),
            onTap: () {
              print("Detail Actor${casts[i].name}");
            },
          );
        });
  }
}
