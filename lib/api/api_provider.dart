import 'package:dio/dio.dart';
import 'package:flutter_bloc_articles/models/api_list_response.dart';
import '../models/api_response.dart';
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

  Future<List<Estate>> fetchEstateList(int page) async {
    try {
      Response response = await _dio.get('${_walyaungUrl}api/estates?$page');
      var responseData = ApiListResponse.fromJson(response.data);
      return List<Estate>.from(
          responseData.data!.map<Estate>((e) => Estate.fromJson(e)));
    } catch (error) {
      return [];
    }
  }

  Future<Estate> fetchEstate(int id) async {
    try {
      Response response = await _dio.get('${_walyaungUrl}api/estates/$id');
      var responseData = ApiResponse.fromJson(response.data);
      return Estate.fromJson(responseData.data!);
    } catch (error) {
      return Estate.withError("Data not found / Connection issue");
    }
  }
}
