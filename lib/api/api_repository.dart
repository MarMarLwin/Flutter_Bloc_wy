import 'package:flutter_bloc_articles/api/api_provider.dart';
import 'package:flutter_bloc_articles/models/covid.dart';

import '../models/article.dart';
import '../models/estate.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<List<Article>> fetchArticleList() {
    return _provider.fetchArticleList();
  }

  Future<CovidModel> fetchCovidList() {
    return _provider.fetchCovidList();
  }

  Future<List<Estate>> fetchEstateList({int page = 1}) {
    return _provider.fetchEstateList(page);
  }

  Future<Estate> fetchEstate(int id) {
    return _provider.fetchEstate(id);
  }

  Future<Estate> setFavourite(int id) {
    return _provider.setFavouriteEstate(id);
  }
}

class NetworkError extends Error {}
