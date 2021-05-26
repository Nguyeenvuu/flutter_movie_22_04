import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:movie_app/repositories/MovieApiClient.dart';

import '../../repositories/MovieApiClient.dart';

class VideoScreen extends StatefulWidget {
  final int id;

  VideoScreen({this.id});
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'fRRCRVoMjWI', // id youtube video
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ));
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MovieApiClient.getYoutubeId(widget.id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Image.asset("assets/images/backdrop_default.PNG"),
          );
        }
        if (snapshot.hasData) {
          String idyoutube = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
            ),
            body: Container(
              color: Colors.black,
              child: Center(
                child: Container(
                  child: YoutubePlayer(
                    controller: YoutubePlayerController(
                        initialVideoId: idyoutube,
                        flags: YoutubePlayerFlags(
                          autoPlay: true,
                          mute: false,
                        )),
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.blueAccent,
                  ),
                ),
              ),
            ),
          );
        }
        return Center(
          child: Container(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
