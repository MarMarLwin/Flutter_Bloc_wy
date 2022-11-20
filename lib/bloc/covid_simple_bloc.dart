
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_articles/api/api_repository.dart';
import 'package:rxdart/rxdart.dart';

import '../models/covid.dart';

final simpleBloc = CovidSimpleBloc();

class CovidSimpleBloc {
  final repository=ApiRepository();
  final covidFetcher=PublishSubject<CovidModel>();
  Stream<CovidModel> get allList => covidFetcher.stream;


  fetchAllMovies() async {
    CovidModel itemModel = await repository.fetchCovidList();
    covidFetcher.sink.add(itemModel);
  }

  dispose() {
    covidFetcher.close();
  }



}