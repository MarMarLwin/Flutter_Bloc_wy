import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_articles/events/estate_event.dart';
import '../bloc/estate_bloc.dart';
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
  final _controller = ScrollController();

  @override
  void initState() {
    _estateBloc.add(GetEstateList());
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels != 0) {
          _estateBloc.add(LoadMore(2));
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    //_estateBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                      return ListView.separated(
                        controller: _controller,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.estateList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              // _estateBloc.add(
                              //     GetEstate(state.estateList[index].id ?? 1));
                              // print('------------');
                              Navigator.pushNamed(context, estateDetail,
                                  arguments: state.estateList[index].id!);
                            },
                            child: PropertyWidget(
                              estate: state.estateList[index],
                              boxFit: BoxFit.fitWidth,
                              width: screenWidth,
                              isFavourite:
                                  state.estateList[index].favourite ?? false,
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: dimen16,
                          );
                        },
                      );
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

  Widget _buildEstateList(BuildContext context, List<Estate> estates) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: estates.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: PropertyWidget(
            estate: estates[index],
            boxFit: BoxFit.fitWidth,
            width: screenWidth,
            isFavourite: estates[index].favourite ?? false,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: dimen16,
        );
      },
    );
  }
}
