import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_articles/states/estate_state.dart';
import 'package:rxdart/rxdart.dart';
import '../api/api_repository.dart';
import '../events/estate_event.dart';
import '../models/estate.dart';

class EstateBloc extends Bloc<EstateEvent, EstateState> {
  EstateBloc() : super(EstateInitial()) {
    final apiRepository = ApiRepository();
    final List<Estate> mEstateList = [];
//Sink<void> get loadMore => _estateStateController.sink;

// @override
// Stream<EstateState> mapEventToState(EstateEvent event) async*{

//    if(currentS is EstateLoaded){
//       final mList = await apiRepository.fetchEstateList(page: event.);

//       emit(EstateLoaded(state.))

//    }
// }

    on<GetEstateList>((event, emit) async {
      try {
        emit(EstateLoading());
        final mList = await apiRepository.fetchEstateList(page: event.page);
        mEstateList.addAll(mList);
        emit(EstateLoaded(mEstateList));
        /* if(mList.isEmpty!=null){
          emit(EstateError(mList.error));
        }*/
      } on NetworkError {
        emit(const EstateError(
            "Failed to fetch estate data.Is your device online?"));
      }
    });

    on<LoadMore>(((event, emit) async {
      try {
        final mList = await apiRepository.fetchEstateList(page: event.page);
        mEstateList.addAll(mList);
        emit(EstateLoadMore(mEstateList));
        emit(EstateLoaded(mEstateList));
      } on Error {
        emit(const EstateError('Failded to load more'));
      }
    }));

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
      } on Error {
        emit(const EstateError("Failed to set favourite"));
      }
    });
  }
}

class EstateLoadmoreBloc extends Bloc<EstateEvent, EstateState> {
  int page = 0;
  final ApiRepository apiRepository = ApiRepository();
  final _loadMoreController = PublishSubject<void>();

  Sink<void> get loadMore => _loadMoreController.sink;

  final _estateStateController = StreamController();
  final _estateEventController = StreamController();

  late Stream<List<Estate>?> estateListStream = Stream.empty();

  EstateLoadmoreBloc(super.initialState) {}

  // EstateLoadmoreBloc()  {
  //   final ApiRepository apiRepository = ApiRepository();
  //   _estateEventController.stream.listen((event) {
  //     estateListStream = _estateStateController.stream
  //         .asyncMap((event) => apiRepository.fetchEstateList(page: page));
  //   });
  // }
}
