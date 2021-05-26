import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/models/api_cast_online.dart';

abstract class CastState extends Equatable {}

class CastInitialState extends CastState {
  @override
  List<Object> get props => [];
}

class CastLoadingState extends CastState {
  @override
  List<Object> get props => [];
}

class CastLoadedState extends CastState {
  final List<Cast> casts;
  CastLoadedState({@required this.casts});
  get castList => casts;

  @override
  List<Object> get props => null;
}

class CastErrorState extends CastState {
  final String message;
  CastErrorState({@required this.message});
  @override
  List<Object> get props => null;
}
