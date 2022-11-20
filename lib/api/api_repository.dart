import 'package:flutter_bloc_articles/api/api_provider.dart';
import 'package:flutter_bloc_articles/models/covid.dart';

import '../models/estate.dart';


class ApiRepository {
  final _provider = ApiProvider();
/*

  Future<Article> fetchArticleList() {
    return _provider.fetchArticleList();
  }
*/

  Future<CovidModel> fetchCovidList() {
    return _provider.fetchCovidList();
  }

  Future<List<Estate>> fetchEstateList(){
    return _provider.fetchEstateList();
  }

  Future<Estate> fetchEstate(int id){
    return _provider.fetchEstate(id);
  }
}

class NetworkError extends Error {}