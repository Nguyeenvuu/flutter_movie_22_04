import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/register_bloc.dart/register_event.dart';
import 'package:movie_app/blocs/register_bloc.dart/register_state.dart';
import 'package:movie_app/blocs/validators/validators.dart';
import 'package:movie_app/repositories/user_repository_server.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepositoryServer _userRepository;

  RegisterBloc({UserRepositoryServer userRepository})
      : _userRepository = userRepository,
        super(RegisterState.initial());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterEmailChanged) {
      yield* _mapRegisterEmailChangeToState(event.email);
    } else if (event is RegisterPasswordChanged) {
      yield* _mapRegisterPasswordChangeToState(event.password);
    } else if (event is RegisterSubmitted) {
      yield* _mapRegisterSubmittedToState(
          email: event.email,
          password: event.password,
          userName: event.userName,
          name: event.name,
          address: event.address,
          gender: event.gender,
          birthday: event.birthday,
          favorite: event.favorite);
    }
  }

  Stream<RegisterState> _mapRegisterEmailChangeToState(String email) async* {
    yield state.update(isEmailValid: Validators.isValidEmail(email));
  }

  Stream<RegisterState> _mapRegisterPasswordChangeToState(
      String password) async* {
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
  }

  Stream<RegisterState> _mapRegisterSubmittedToState(
      {String userName,
      String password,
      String name,
      String email,
      String address,
      String birthday,
      String gender,
      String favorite}) async* {
    try {
      yield RegisterState.loading();
      Map<String, dynamic> resData = await _userRepository.register(
          userName: userName,
          password: password,
          name: name,
          email: email,
          address: address,
          gender: gender,
          birthday: birthday,
          favorite: favorite);
      if (resData["Register success"]) {
        yield RegisterState.success();
      }
    } catch (error) {
      print(error);
      yield RegisterState.failure();
    }
  }
}
