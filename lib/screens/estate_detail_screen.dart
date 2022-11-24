import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_articles/bloc/estate_bloc.dart';
import 'package:flutter_bloc_articles/events/estate_event.dart';

import '../states/estate_state.dart';
import '../utils/dimensions.dart';
import '../utils/images.dart';
import '../widgets/loading_widget.dart';

class EstateDetailScreen extends StatefulWidget {
  final int estateId;
  const EstateDetailScreen({super.key, required this.estateId});

  @override
  State<EstateDetailScreen> createState() => _EstateDetailScreenState();
}

class _EstateDetailScreenState extends State<EstateDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List tabs;
  int _currentIndex = 0;
  PageController pageController = PageController(viewportFraction: 1);
  var _indicatorIndex = 0.0;
  List<String> propertiesList = [];

  EstateBloc _estateBloc = new EstateBloc();
  @override
  void dispose() {
    //_tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _estateBloc.add(GetEstate(widget.estateId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: BlocProvider(
          create: (_) => _estateBloc,
          child:
              BlocBuilder<EstateBloc, EstateState>(builder: (context, state) {
            if (state is EstateInitial) {
              return buildLoading();
            } else if (state is EstateLoading) {
              return buildLoading();
            } else if (state is EstateShow) {
              return Column(children: [
                Container(
                    height: dimen250,
                    width: screenWidth,
                    color: Colors.grey.shade100,
                    child: Hero(
                        tag: state.estate.id!,
                        child: state.estate.images!.isNotEmpty
                            ? (Image.network(
                                state.estate.images!.first.large_url ?? '',
                                fit: BoxFit.contain))
                            : Image.asset(ConstantImages.emptyImage,
                                fit: BoxFit.contain))),
              ]);
            } else if (state is EstateError) {
              return Container();
            } else {
              return Container();
            }
          })),
    ));
  }
}
