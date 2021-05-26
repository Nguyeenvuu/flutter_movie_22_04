import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:movie_app/blocs/cast_and_crew_bloc/cast_event.dart';
import 'package:movie_app/blocs/cast_and_crew_bloc/cast_state.dart';
import 'package:movie_app/models/api_cast_online.dart';
import 'package:movie_app/repositories/cast_and_crew_repository.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  CastAndCrewRepository repository;

  CastBloc({@required this.repository}) : super(null);

  @override
  // TODO: implement initialState
  CastState get initialState => CastInitialState();

  @override
  Stream<CastState> mapEventToState(CastEvent event) async* {
    // TODO: implement mapEventToState

    if (event is FetchCastAndCrewEvent) {
      yield CastLoadingState();
      try {
        List<Cast> casts = await repository.getCastList(event.movieId);
        yield CastLoadedState(casts: casts);
      } catch (e) {
        yield CastErrorState(message: e.toString());
      }
    }
  }
}
