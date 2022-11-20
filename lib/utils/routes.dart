import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_articles/screens/estate_detail_screen.dart';

const estateDetail = '/estateDetail';

class RouteHelper {
  static Map<String, Widget Function(BuildContext)> routes = {
    estateDetail: (context) => EstateDetailScreen(
        estateId: ModalRoute.of(context)!.settings.arguments as int),
  };
}
