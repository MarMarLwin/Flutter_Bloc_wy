
import 'package:equatable/equatable.dart';

import '../models/estate.dart';

abstract class EstateState extends Equatable {
  const EstateState();

  @override
  List<Object?> get props => [];
}
class EstateInitial extends EstateState {}

class EstateLoading extends EstateState {}

class EstateLoaded extends EstateState {
  final List<Estate> estateList;

  const EstateLoaded(this.estateList);

}
class EstateShow extends EstateState{
  final Estate estate;
  const EstateShow(this.estate);
}

class EstateError extends EstateState {
  final String? message;
  const EstateError(this.message);
}