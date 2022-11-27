import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_articles/events/estate_event.dart';
import '../bloc/estate_bloc.dart';
import '../events/estate_event.dart';
import '../models/estate.dart';
import '../states/estate_state.dart';
import '../utils/dimensions.dart';
import '../utils/routes.dart';
import '../widgets/loading_widget.dart';
import '../widgets/property_widget.dart';

class EstateListScreen extends StatefulWidget {
  const EstateListScreen({Key? key}) : super(key: key);

  @override
  State<EstateListScreen> createState() => _EstateListScreenState();
}

class _EstateListScreenState extends State<EstateListScreen> {
  final EstateBloc _estateBloc = EstateBloc();
  // final EstateLoadmoreBloc _bloc = EstateLoadmoreBloc();
  final _controller = ScrollController();
  int page = 1;

  @override
  void initState() {
    super.initState();
    _estateBloc.add(GetEstateList(page));

    _controller.addListener(() {
      if (_controller.position.atEdge) {
        bool isTop = _controller.position.pixels == 0;
        if (isTop) {
        } else {
          page++;
          _estateBloc.add(LoadMore(page));
        }
      }
    });
  }

  @override
  void dispose() {
    // _estateBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _controller,
          //   child: _buildEstateList(context),
          child: BlocProvider(
              create: (_) => _estateBloc,
              child: BlocListener<EstateBloc, EstateState>(
                listener: (context, state) {
                  if (state is EstateError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message!),
                      ),
                    );
                  }
                },
                child: BlocBuilder<EstateBloc, EstateState>(
                  builder: (context, state) {
                    if (state is EstateInitial) {
                      return buildLoading();
                    } else if (state is EstateLoading) {
                      return buildLoading();
                    } else if (state is EstateLoaded) {
                      return _buildEstateList(context, state.estateList, false);
                    } else if (state is EstateLoadMore) {
                      return _buildEstateList(context, state.estateList, true);
                    } else if (state is EstateError) {
                      return Container();
                    } else {
                      return Container();
                    }
                  },
                ),
              )),
        ),
      ),
    );
  }

  Widget _buildEstateList(
      BuildContext context, List<Estate> dataList, bool loadmore) {
    return Column(
      children: [
        ListView.separated(
          //controller: _controller,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, estateDetail,
                    arguments: dataList[index].id!);
              },
              child: PropertyWidget(
                estate: dataList[index],
                boxFit: BoxFit.fitWidth,
                width: screenWidth,
                isFavourite: dataList[index].favourite ?? false,
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: dimen16,
            );
          },
        ),
        if (loadmore) buildLoading()
      ],
    );
  }
}
