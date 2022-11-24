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
        print('-----${mEstate.id}');
        emit(EstateShow(mEstate));
      } on NetworkError {
        emit(const EstateError(
            "Failed to fetch estate data.Is your device online?"));
      }
    });
  }
}
