import 'package:equatable/equatable.dart';

abstract class EstateEvent extends Equatable {
  const EstateEvent();

  @override
  List<Object> get props => [];
}

class GetEstateList extends EstateEvent {}

class GetEstate extends EstateEvent {
  final int id;
  const GetEstate(this.id);
}

class SetFavourite extends EstateEvent {
  final int id;
  final bool isFavourite;
  const SetFavourite(this.id, this.isFavourite);
}
