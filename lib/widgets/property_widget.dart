import 'package:flutter/material.dart';
import '../models/estate.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_text_row.dart';
import 'rounded_bg_text.dart';
import 'small_text.dart';
import '../utils/images.dart';

class PropertyWidget extends StatefulWidget {
  final BoxFit boxFit;
  final double? width;
  final Estate estate;
  bool isFavourite;

  PropertyWidget({
    Key? key,
    required this.boxFit,
    this.width = 300,
    required this.estate,
    required this.isFavourite,
  }) : super(key: key);

  @override
  State<PropertyWidget> createState() => _PropertyWidgetState();
}

class _PropertyWidgetState extends State<PropertyWidget> {
  @override
  void initState() {
    // Get.lazyPut(() => FavouriteEstateController(repo: Get.find()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: dimen450,
      width: widget.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(dimen10)),
          color: Colors.grey.shade50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              (widget.estate.images!.isNotEmpty)
                  ? Image.network(
                      widget.estate.images!.first.medium_url ?? '',
                      fit: widget.boxFit,
                      width: widget.width,
                      height: dimen250,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Container();
                      },
                    )
                  : Image.asset(
                      ConstantImages.emptyImage,
                      fit: widget.boxFit,
                      width: widget.width,
                      height: dimen250,
                    ),
              Positioned(
                  top: dimen10,
                  left: dimen10,
                  right: dimen10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundedBGText(
                          text: widget.estate.estate_type!.name!.toUpperCase(),
                          textColor: Colors.white,
                          color: Colors.blueAccent),
                      RoundedBGText(
                          text: widget.estate.type ?? '',
                          textColor: Colors.white,
                          color: Colors.blueAccent),
                    ],
                  )),
              /*  Positioned(
                  right: dimen10,
                  bottom: dimen10,
                  child: GetBuilder<FavouriteEstateController>(
                      builder: (favController) {
                        return InkWell(
                          onTap: () {
                            if (!isLogin()) {
                              showActionDialog(
                                  context, 'warning'.tr, 'request_login'.tr,
                                      () async {
                                    Get.lazyPut(
                                            () => SignInController(repo: Get.find()));
                                    Get.toNamed(RouteHelper.getLogin());
                                  });
                            } else {
                              if (widget.isFavourite) {
                                favController.removeFavCar(widget.estate.id ?? 0);
                                setState(() {
                                  widget.isFavourite = false;
                                });
                              } else {
                                favController.addFavEstate(widget.estate.id ?? 0);
                                setState(() {
                                  widget.isFavourite = true;
                                });
                              }
                            }
                          },
                          child: AppIcon(
                            icon: Icons.favorite,
                            size: dimen32,
                            iconColor: (widget.isFavourite)
                                ? secondaryColor
                                : Colors.white,
                            backgroundColor: primaryColor,
                          ),
                        );
                      })),*/
              Positioned(
                  left: dimen10,
                  bottom: dimen10,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      // borderRadius: BorderRadius.only(topRight: Radius.circular(dimen20),bottomLeft: Radius.circular(dimen20))
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: dimen10 / 2, vertical: 0),
                    child: IconAndTextRow(
                      icon: Icons.remove_red_eye,
                      size: dimen20,
                      iconColor: Colors.white,
                      text: widget.estate.view_count == null
                          ? '0'
                          : widget.estate.view_count.toString(),
                      textSize: dimen16,
                      textColor: Colors.white,
                    ),
                  ))
            ],
          ),
          SizedBox(height: dimen10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: dimen10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SmallText(
                  text: widget.estate.title ?? '',
                  size: dimen18,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                  // maxLine: 2,
                ),
                SizedBox(height: dimen10 / 2),
                Visibility(
                  // visible: isEnglish(),
                  visible: true,
                  child: Row(children: [
                    BigText(
                        text: widget.estate.price!,
                        color: Colors.orange,
                        size: dimen18,
                        fontWeight: FontWeight.bold),
                    SizedBox(
                      width: dimen10 / 2,
                    ),
                    BigText(
                        text: widget.estate.currency ?? '',
                        color: Colors.orange,
                        size: dimen18,
                        fontWeight: FontWeight.bold),
                  ]),
                ),
                /*Visibility(
                  visible: !isEnglish(),
                  child: Row(
                    children: [
                      BigText(
                          text: showCurrency(widget.currency),
                          color: secondaryColor,
                          size: dimen18,
                          fontWeight: FontWeight.bold),
                      SizedBox(width: dimen10/2,),
                      BigText(
                          text: currencyFormat(double.parse(widget.price)),
                          color: secondaryColor,
                          size: dimen18,
                          fontWeight: FontWeight.bold),

                    ],
                  ),
                ),*/
                SizedBox(height: dimen10 / 2),

                SmallText(
                  text: widget.estate.description
                          ?.replaceAll('*', '•')
                          .replaceAll('-', '•')
                          .replaceAll('\n\n', '\n') ??
                      '',
                  maxLine: 3,
                  size: dimen14,
                ),
                SizedBox(height: dimen10 / 2),
                // properties icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.bed_rounded,
                            color: Colors.blue, size: dimen20),
                        SizedBox(width: dimen10 / 2),
                        BigText(
                          text: widget.estate.master_bed_room.toString(),
                          size: dimen14,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.bathtub, color: Colors.blue, size: dimen20),
                        SizedBox(width: dimen10 / 2),
                        BigText(
                            text: widget.estate.bathroom.toString(),
                            size: dimen14)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.single_bed,
                            color: Colors.blue, size: dimen20),
                        SizedBox(width: dimen10 / 2),
                        BigText(
                            text: widget.estate.single_bed_room.toString(),
                            size: dimen14)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.now_widgets_outlined,
                            color: Colors.blue, size: dimen20),
                        SizedBox(width: dimen10 / 2),
                        Visibility(
                          visible: widget.estate.dimension == 'area',
                          child: BigText(
                              text:
                                  '${widget.estate.area_width?.replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "")}\' x ${widget.estate.area_length?.replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "")}\'',
                              size: dimen14),
                        ),
                        Visibility(
                          visible: widget.estate.dimension == 'sqft',
                          child: BigText(
                              text:
                                  '${widget.estate.area?.replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "")} ft²',
                              size: dimen14),
                        ),
                        Visibility(
                          visible: widget.estate.dimension == 'acre',
                          child: BigText(
                              text:
                                  '${widget.estate.area?.replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "")} acre',
                              size: dimen14),
                        )
                      ],
                    )
                  ],
                ),

                Divider(
                  height: dimen10 / 2,
                  thickness: dimen10 / 8,
                  color: Colors.blue,
                ),
                //code and share
                SizedBox(
                  height: dimen30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallText(
                          text: 'CODE' + ':${widget.estate.code ?? ''}',
                          color: Colors.blue,
                          size: dimen14,
                          fontWeight: FontWeight.bold),
                      InkWell(
                          onTap: () {
                            /* Share.share(
                                '$estateWebSiteUrl${widget.estate.id ?? 0}');*/
                          },
                          child: const Icon(Icons.share, color: Colors.black))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
