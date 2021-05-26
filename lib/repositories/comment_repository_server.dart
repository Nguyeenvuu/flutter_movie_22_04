import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movie_app/models/comment.dart';
import 'package:movie_app/utils/url_base.dart';

class CommentRepositoryServer {
  static http.Client httpClient = http.Client();

  Future<List<Comment>> listCommentByUserId({int userId}) async {
    List<Comment> listComent = List<Comment>();
    print(commentByCustomerUrl);
    http.Response response = await http.get(commentByCustomerUrl + '$userId');
    List resData = json.decode(response.body);
    print(response.statusCode);
    print("hi");

    if (response.statusCode == 200) {
      resData.forEach((comment) {
        int userid = comment['user'] ?? userId;
        int movieId = comment['movie'] ?? 10;
        String content = comment['content'] ?? 'This is comment';

        var timeStamp = comment['timestamp'] != null
            ? DateTime.parse(comment['timestamp'])
            : DateTime.now();
        Comment newComment = Comment(
            userId: userid,
            movieId: movieId,
            content: content,
            timeStamp: timeStamp);
        listComent.add(newComment);
      });
      print(listComent);
      return listComent;
    } else {
      print(response.statusCode);
      return List<Comment>();
    }
  }

  // ignore: missing_return
  Future<List<Comment>> listCommentByMovieId({dynamic movieId}) async {
    List<Comment> listComent = List<Comment>();
    print(commentByMovieUrl);
    try {
      http.Response response = await http.get(commentByMovieUrl + '$movieId');
      List resData = json.decode(response.body);

      if (response.statusCode == 200) {
        resData.forEach((comment) {
          int userId = comment['user'] ?? 8;
          int movieid = comment['movie'] ?? 10;
          String content = comment['content'] ?? 'This is comment';

          var timeStamp = comment['timestamp'] != null
              ? DateTime.parse(comment['timestamp'])
              : DateTime.now();
          Comment newComment = Comment(
              userId: userId,
              movieId: movieid,
              content: content,
              timeStamp: timeStamp);
          listComent.add(newComment);
        });

        return listComent;
      } else {
        return List<Comment>();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Map<String, dynamic>> createComment({
    int userId,
    int movieId,
    String content,
  }) async {
    print(createCommentUrl);

    http.Response response = await http.post(
      createCommentUrl,
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(
        <String, dynamic>{
          // ignore: unnecessary_cast
          'user_id': userId,
          'content': content,
          'movie_id': movieId,
        },
      ),
    );

    Map<String, dynamic> resData = json.decode(response.body);

    return resData;
  }
}
