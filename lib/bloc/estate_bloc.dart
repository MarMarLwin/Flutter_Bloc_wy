import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_articles/states/estate_state.dart';

import '../api/api_repository.dart';
import '../events/estate_event.dart';

class EstateBloc extends Bloc<EstateEvent, EstateState> {
  EstateBloc() : super(EstateInitial()) {
    final ApiRepository apiRepository = ApiRepository();
    on<GetEstateList>((event, emit) async {
      try {
        emit(EstateLoading());
        final mList = await apiRepository.fetchEstateList();
        emit(EstateLoaded(mList));
        /* if(mList.isEmpty!=null){
          emit(EstateError(mList.error));
        }*/
      } on NetworkError {
        emit(const EstateError(
            "Failed to fetch estate data.Is your device online?"));
      }
    });

    on<GetEstate>((event, emit) async {
      try {
        emit(EstateLoading());
        final mEstate = await apiRepository.fetchEstate(event.id);
        debugPrint('-----${mEstate.id}');
        emit(EstateShow(mEstate));
      } on NetworkError {
        emit(const EstateError(
            "Failed to fetch estate data.Is your device online?"));
      }
    });

    on<SetFavourite>((event, emit) async {
      try {
        var estate = await apiRepository.setFavourite(event.id);
        print('-----$estate');
      } on Error {
        emit(const EstateError("Failed to set favourite"));
      }
    });
  }
}
