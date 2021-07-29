import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/blocs/LoginPageBloc.dart';
import 'package:movie_app/blocs/comment_bloc/comment_bloc.dart';
import 'package:movie_app/blocs/comment_bloc/comment_event.dart';
import 'package:movie_app/blocs/comment_bloc/comment_state.dart';
import 'package:movie_app/models/Movie.dart';
import 'package:movie_app/models/User.dart';
import 'package:movie_app/models/comment.dart';
import 'package:movie_app/repositories/user_repository_server.dart';
import 'package:movie_app/utils/input_format.dart';
import 'package:provider/provider.dart';

class CommentPage extends StatefulWidget {
  final Movie movie;
  final User user;
  const CommentPage({Key key, this.movie, this.user}) : super(key: key);
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final TextEditingController _contentTextEditing = TextEditingController();

  CommentBloc _commentBloc;
  User _user;

  @override
  void initState() {
    super.initState();
    _commentBloc = BlocProvider.of(context);
    _user = Provider.of<LoginPageBloc>(context, listen: false).user;
  }

  Color colorwhite = Colors.white;
  Color colorbackground = Color(0xFF2d3450);
  @override
  Widget build(BuildContext context) {
    // return BlocProvider<CommentBloc>(
    //   create: (context) => CommentBloc(repository: CommentRepositoryServer())
    //     ..add(FetchCommentEvent(movieId: "${widget.movie.id}")),
    //   child:

    // print(_user.name);
    print(_user);

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
                    inputFormatters: [
                      Utf8LengthLimitingTextInputFormatter(120),
                    ],
                    controller: _contentTextEditing,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "Write comment...",
                        hintStyle: TextStyle(color: Colors.white)),
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
                  onPressed: _addComment,
                ),
              )
            ],
          ),
          Container(
            height: 400,
            color: Color(0xFF2d3450),
            child: BlocBuilder<CommentBloc, CommentState>(
                builder: (context, commentState) {
              if (commentState is CommentLoadingState) {
                return Container();
              }
              if (commentState is CommentLoadedState) {
                List<Comment> comments = commentState.commentList;
                return Container(
                  height: 300,
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      children: comments.map((comment) {
                        List<int> encodeChar = utf8.encode(comment.content);

                        return ListTile(
                          leading: FutureBuilder(
                            future: UserRepositoryServer.getUSerById(
                                userId: comment.userId),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Text('');
                              }
                              if (snapshot.hasData) {
                                final String nameUser = snapshot.data;
                                return Container(
                                  margin: EdgeInsets.only(left: 10),
                                  width: 70,
                                  child: Center(
                                    child: Text(
                                      nameUser,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return Text('');
                            },
                          ),
                          title: Text(
                            DateFormat.yMMMd().format(comment.timeStamp),
                            style: TextStyle(color: colorwhite),
                          ),
                          subtitle: Text(
                            '${utf8.decode(encodeChar)}',
                            // "asdasdasdasdasdasdasdasdasdasdasdadasdasdasdadad asdaaaaaaaaaaaaaaadsa dasdddddddddddasda",
                            style: TextStyle(color: colorwhite),
                          ),
                        );
                      }).toList()),
                );
              }
              if (commentState is CommentErrorState) {
                return (Text("fail2"));
              }
              return (Text("fail"));
            }),
          ),
        ],
      ),
    );
    // );
  }

  void _addComment() {
    print("add");
    _commentBloc.add(AddCommentEvent(
      movieId: widget.movie.id,
      userId: widget.user.userId,
      content: _contentTextEditing.text,
    ));
    _commentBloc.add(FetchCommentEvent(movieId: "${widget.movie.id}"));
    print("add success");
    _contentTextEditing.text = "";
  }

  @override
  void dispose() {
    super.dispose();
  }
}
