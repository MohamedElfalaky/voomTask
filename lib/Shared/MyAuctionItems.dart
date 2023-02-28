import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voom_task/helpers/my_application.dart';
import 'package:voom_task/style/icons_file.dart';

class MyAuctionItems extends StatelessWidget {
  final String? img;
  final String? title;
  final String? area;
  final String? floors;
  final String? statee;
  final DateTime? createdAt;
  final String? price;
  final String? priceDollar;
  final String? adId;
  final bool? isFavorite;

  const MyAuctionItems(
      {super.key,
      this.img,
      this.title,
      this.area,
      this.floors,
      this.statee,
      this.createdAt,
      this.price,
      this.priceDollar,
      this.adId,
      this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      // height: 380,
      // width: 330,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(img ?? defaultHouse),
                      fit: BoxFit.fill),
                  // color: Colors.green,
                ),
                height: MyApplication.hightClc(context, 176),
              ),
              // isFavorite != null
              //     ?
              isFavorite == null
                  ? const SizedBox()
                  : Container(
                      margin: EdgeInsets.only(
                          top: MyApplication.hightClc(context, 8),
                          left: MyApplication.widthClc(context, 8)),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white.withOpacity(0.7),
                      ),
                      child: Center(
                          child: isFavorite == true
                              ? InkWell(
                                  onTap: () {
                                    // RemoveFromFavoriteCubit.get(context)
                                    //     .userRemoveFromFavorite(
                                    //         adId!,
                                    //         CacheHelper.getFromShared("token"),
                                    //         context);
                                  },
                                  child: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    // if (CacheHelper.getFromShared("token") ==
                                    //     null) {
                                    //   showDialog(
                                    //     context: context,
                                    //     builder: (BuildContext myContext) {
                                    //       return SorryPopUp();
                                    //     },
                                    //   );
                                    // } else {
                                    //   //add fav
                                    //   AddToFavoriteCubit.get(context)
                                    //       .userAddToFavorite(
                                    //           adId!,
                                    //           CacheHelper.getFromShared(
                                    //               "token"),
                                    //           context);
                                    // }
                                  },
                                  child: const Icon(
                                    Icons.favorite_outline,
                                    color: Colors.red,
                                  ),
                                )),
                    )
              // : Container()
            ],
          ),
          Container(
            decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: MyApplication.widthClc(context, 12),
                vertical: MyApplication.hightClc(context, 8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 8, top: 8),
                  child: Text(
                    title ?? "",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 6, bottom: 8),
                            height: 14,
                            width: 14,
                            child: SvgPicture.asset("assets/AdsPics/area.svg"),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 8, bottom: 8),
                            child: Text(
                              "${area ?? ""} m",
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                right: MyApplication.widthClc(context, 6),
                                bottom: MyApplication.hightClc(context, 8)),
                            height: MyApplication.hightClc(context, 14),
                            width: MyApplication.widthClc(context, 14),
                            child: SvgPicture.asset(
                                "assets/AdsPics/floor no..svg"),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                bottom: MyApplication.hightClc(context, 8)),
                            child: Text(
                              "${floors ?? ""} ${'floors'}",
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                        flex: 2,
                        child: Row(children: [
                          Container(
                              margin: EdgeInsets.only(
                                  right: MyApplication.widthClc(context, 6),
                                  bottom: MyApplication.hightClc(context, 8)),
                              height: MyApplication.hightClc(context, 14),
                              width: MyApplication.widthClc(context, 14),
                              child: SvgPicture.asset(
                                  "assets/AdsPics/location.svg")),
                          Container(
                            margin: EdgeInsets.only(
                                bottom: MyApplication.hightClc(context, 12)),
                            child: Text(
                              statee ?? "",
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ])),
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                bottom: MyApplication.hightClc(context, 12),
                                right: MyApplication.widthClc(context, 6),
                              ),
                              height: MyApplication.hightClc(context, 14),
                              width: MyApplication.widthClc(context, 14),
                              child: SvgPicture.asset(
                                  "assets/AdsPics/post date.svg")),
                          Container(
                            margin: EdgeInsets.only(
                                bottom: MyApplication.hightClc(context, 12)),
                            child: Text(
                              createdAt != null ? createdAt.toString() : "",
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "${price ?? ""} \$",
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: "Tajawal",
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () async {
                          // await Share.share("sharedtext");
                        },
                        icon: Icon(
                          Icons.share,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 20,
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
