import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/register_bloc.dart/register_bloc.dart';
import 'package:movie_app/blocs/register_bloc.dart/register_event.dart';
import 'package:movie_app/blocs/register_bloc.dart/register_state.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/models/genre.dart';

class RegisterForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<RegisterForm> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final List<String> favorite = [];

  DateTime _selectedDate;
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
    sciencefiction: false,
    thriller: false,
    war: false,
    western: false,
  );

  bool get isPopulated =>
      _emailController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty &&
      _userNameController.text.isNotEmpty;

  bool isButtonEnabled(RegisterState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }


  RegisterBloc _registerBloc;

  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _emailController.addListener(_onEmailChange);
    _passwordController.addListener(_onPasswordChange);
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now())
        .then((dateTime) {
      if (dateTime == null) {
        return;
      }
      setState(() {
        _selectedDate = dateTime;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.isFailure) {
          Scaffold.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Register Failure'),
                    Icon(Icons.error),
                  ],
                ),
                backgroundColor: Color(0xffffae88),
              ),
            );
        }
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Registering...'),
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  ],
                ),
                backgroundColor: Color(0xffffae88),
              ),
            );
        }

        if (state.isSuccess) {
          Scaffold.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                duration: Duration(seconds: 3),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Register Success'),
                    Icon(Icons.access_alarms_outlined),
                  ],
                ),
                backgroundColor: Colors.blue[400],
              ),
            );
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(5.0),
            margin: EdgeInsets.all(25.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFF2d3447),
                              blurRadius: 25,
                              offset: Offset(0, 10))
                        ]),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              icon: Icon(Icons.account_circle),
                              labelText: "Your name",
                            ),
                            keyboardType: TextInputType.text,
                            autovalidate: true,
                            autocorrect: false,
                          ),
                          TextFormField(
                            controller: _userNameController,
                            decoration: InputDecoration(
                              icon: Icon(Icons.account_box),
                              labelText: "User name",
                            ),
                            keyboardType: TextInputType.text,
                            autovalidate: true,
                            autocorrect: false,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              labelText: "Password",
                            ),
                            obscureText: true,
                            autovalidate: true,
                            autocorrect: false,
                            validator: (_) {
                              return !state.isPasswordValid
                                  ? 'Invalid Password'
                                  : null;
                            },
                          ),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              icon: Icon(Icons.email),
                              labelText: "Email",
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autovalidate: true,
                            autocorrect: false,
                            validator: (_) {
                              return !state.isEmailValid
                                  ? 'Invalid Email'
                                  : null;
                            },
                          ),
                          TextFormField(
                            controller: _addressController,
                            decoration: InputDecoration(
                              icon: Icon(Icons.account_circle),
                              labelText: "Address",
                            ),
                            keyboardType: TextInputType.streetAddress,
                            autovalidate: true,
                            autocorrect: false,
                          ),
                          Row(
                            children: [
                              FlatButton(
                                child: Text("Choose Birthday"),
                                onPressed: _presentDatePicker,
                                textColor: Color(0xFF2d3457),
                                hoverColor: Colors.pink,
                              ),
                              Text(_selectedDate == null
                                  ? ""
                                  : DateFormat.yMMMd().format(_selectedDate)),
                            ],
                          ),
                          Divider(
                            thickness: 0.8,
                            height: 6,
                            color: Colors.black,
                          ),
                          TextFormField(
                            controller: _genderController,
                            decoration: InputDecoration(
                              icon: Icon(Icons.account_box),
                              labelText: "Gender",
                            ),
                            keyboardType: TextInputType.text,
                            autovalidate: true,
                            autocorrect: false,
                          ),
                          Card(
                            color: Colors.white,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 20, right: 10),
                                  child: Row(
                                    children: [
                                      Text("Adventure"),
                                      Checkbox(
                                        value: genres.adventure,
                                        onChanged: (value) {
                                          setState(() {
                                            genres.adventure =
                                                !genres.adventure;
                                          });
                                        },
                                      ),
                                      Expanded(
                                        child: Text(""),
                                      ),
                                      Text("Action"),
                                      Checkbox(
                                        value: genres.action,
                                        onChanged: (value) {
                                          setState(() {
                                            genres.action = !genres.action;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20, right: 10),
                                  child: Row(
                                    children: [
                                      Text("Comedy   "),
                                      Checkbox(
                                        value: genres.comedy,
                                        onChanged: (value) {
                                          setState(() {
                                            genres.comedy = !genres.comedy;
                                          });
                                        },
                                      ),
                                      Expanded(
                                        child: Text(""),
                                      ),
                                      Text("Crime"),
                                      Checkbox(
                                        value: genres.crime,
                                        onChanged: (value) {
                                          setState(() {
                                            genres.crime = !genres.crime;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20, right: 10),
                                  child: Row(
                                    children: [
                                      Text("Romance "),
                                      Checkbox(
                                        value: genres.romance,
                                        onChanged: (value) {
                                          setState(() {
                                            genres.romance = !genres.romance;
                                          });
                                        },
                                      ),
                                      Expanded(
                                        child: Text(""),
                                      ),
                                      Text("Family"),
                                      Checkbox(
                                        value: genres.family,
                                        onChanged: (value) {
                                          setState(() {
                                            genres.family = !genres.family;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20, right: 10),
                                  child: Row(
                                    children: [
                                      Text("Animation"),
                                      Checkbox(
                                        value: genres.animation,
                                        onChanged: (value) {
                                          setState(() {
                                            genres.animation =
                                                !genres.animation;
                                          });
                                        },
                                      ),
                                      Expanded(
                                        child: Text(""),
                                      ),
                                      Text("War"),
                                      Checkbox(
                                        value: genres.war,
                                        onChanged: (value) {
                                          setState(() {
                                            genres.war = !genres.war;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20, right: 10),
                                  child: Row(
                                    children: [
                                      Text("Thriller      "),
                                      Checkbox(
                                        value: genres.thriller,
                                        onChanged: (value) {
                                          setState(() {
                                            genres.thriller = !genres.thriller;
                                          });
                                        },
                                      ),
                                      Expanded(
                                        child: Text(""),
                                      ),
                                      Text("Drama"),
                                      Checkbox(
                                        value: genres.drama,
                                        onChanged: (value) {
                                          setState(() {
                                            genres.drama = !genres.drama;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    onPressed: () {
                      if (isButtonEnabled(state)) {
                        _onFormSubmitted();
                      }
                    },
                    color: Color(0xFF2d3457),
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: FlatButton(
                        padding: EdgeInsets.only(right: 0),
                        child: Text(
                          "You have account? Login",
                          style: TextStyle(color: Colors.blue, fontSize: 15),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/Login');
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _onEmailChange() {
    _registerBloc.add(RegisterEmailChanged(email: _emailController.text));
  }

  void _onPasswordChange() {
    _registerBloc
        .add(RegisterPasswordChanged(password: _passwordController.text));
  }

  void _onFormSubmitted() {
    String favorites = _mapFavorite(genres);
    print(favorites);
    _registerBloc.add(RegisterSubmitted(
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text,
        userName: _userNameController.text,
        gender: _genderController.text,
        address: _addressController.text,
        birthday: DateFormat.yMMMd().format(_selectedDate),
        favorite: "$favorites"));
  }

  String _mapFavorite(Genre genre) {
    var list = [];
    if (genres.action) {
      list.add('Action');
    }
    if (genres.adventure) {
      list.add('Adventure');
    }
    if (genres.animation) {
      list.add('Animation');
    }
    if (genres.comedy) {
      list.add('Comedy');
    }
    if (genres.crime) {
      list.add('Crime');
    }
    if (genres.drama) {
      list.add('Drama');
    }
    if (genres.family) {
      list.add('Family');
    }
    if (genres.war) {
      list.add('War');
    }
    if (genres.thriller) {
      list.add('Thriller');
    }
    if (genres.romance) {
      list.add('Romance');
    }
    String result = list.join('|');

    return result;
  }
}
