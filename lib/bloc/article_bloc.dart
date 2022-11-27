import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/api_repository.dart';
import '../models/article.dart';
import 'bloc.dart';

class ArticleListBloc {
  // 1
  final _client = ApiRepository();
  // 2
  final _searchQueryController = StreamController<String?>();
  // 3
  Sink<String?> get searchQuery => _searchQueryController.sink;
  // 4
  late Stream<List<Article>?> articlesStream;

  ArticleListBloc() {
    // 5

    articlesStream = _searchQueryController.stream
        .asyncMap((query) => _client.fetchArticleList());
  }

  // 6
  @override
  void dispose() {
    _searchQueryController.close();
  }
}
