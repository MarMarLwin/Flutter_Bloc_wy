import 'package:dio/dio.dart';
import 'package:flutter_bloc_articles/models/estate_response.dart';
import '../models/covid.dart';
import '../models/estate.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url =
      'https://api.covid19api.com/summary'; //'https://api.raywenderlich.com/api/contents';
  final String _walyaungUrl = 'https://walyaung-api.hivestage.com/';

  /*Future<Article> fetchArticleList() async {
    try {
      Response response = await _dio.get(_url);
      return Article.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return Article();
    }
  }*/

  Future<CovidModel> fetchCovidList() async {
    try {
      Response response = await _dio.get(_url);
      return CovidModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CovidModel.withError("Data not found / Connection issue");
    }
  }

  Future<List<Estate>> fetchEstateList() async {
    try {
      Response response = await _dio.get('${_walyaungUrl}api/estates');
      var responseData = EstateResponse.fromJson(response.data);
      return responseData.data!;
    } catch (error, stacktrace) {
      return [];
    }
  }

  Future<Estate> fetchEstate(int id) async {
    try {
      Response response = await _dio.get('${_walyaungUrl}api/estates/$id');
      return Estate.fromJson(response.data);
    } catch (error, stacktrace) {
      return Estate.withError("Data not found / Connection issue");
    }
  }
}
