import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RatingState extends Equatable {}

class RatingInitialState extends RatingState {
  @override
  List<Object> get props => [];
}

class RatingLoadingState extends RatingState {
  @override
  List<Object> get props => [];
}

class RatingLoadedState extends RatingState {
  final Map<String, dynamic> sum_ratings;
  RatingLoadedState({@required this.sum_ratings});
  get sumRatings => sum_ratings;

  @override
  List<Object> get props => null;
}

class RatingErrorState extends RatingState {
  final String message;
  RatingErrorState({@required this.message});
  @override
  List<Object> get props => null;
}
