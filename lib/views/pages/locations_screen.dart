import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:traveling/models/locations.dart';
import 'package:traveling/utils/extensions/string_extension.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_images.dart';
import '../../data/remote/response/Status.dart';
import '../../view_models/locations.vm.dart';
import '../../widgets/LoadingWidget.dart';
import '../../widgets/MyErrorWidget.dart';
import '../../widgets/app_widgets.dart';

class LocateScreen extends StatefulWidget {
  const LocateScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LocateScreenState createState() => _LocateScreenState();
}

class _LocateScreenState extends State<LocateScreen> {
  final LocationListVM viewModel = LocationListVM();

  @override
  void initState() {
    viewModel.fetchLocations();
    super.initState();
  }

  int _itemCount = 2;
  DateTime? currentBackPressTime;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        DateTime now = DateTime.now();

        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
          currentBackPressTime = now;
          toast('Press back again to exit app"');
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {});
            return await 2.seconds.delay;
          },
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        color: primaryColor,
                        image: DecorationImage(
                          image: AssetImage(banner),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: cardColor,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              width: 350,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'what do you want to experience?',
                                    prefixIcon:
                                        Icon(Icons.search, color: primaryColor),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    30.height,
                    Column(children: [
                      Container(
                        child: ChangeNotifierProvider<LocationListVM>(
                          create: (BuildContext context) => viewModel,
                          child: Consumer<LocationListVM>(
                              builder: (context, viewModel, _) {
                            switch (viewModel.LocationMain.status) {
                              case Status.LOADING:
                                return LoadingWidget();
                              case Status.ERROR:
                                return Column(
                                  children: [
                                    MyErrorWidget(
                                        viewModel.LocationMain.message ?? "NA"),
                                    10.height,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          child: Container(
                                            width: 150,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Retry',
                                                style: TextStyle(),
                                              ),
                                            ),
                                          ),
                                          onTap: () {
                                            viewModel.fetchLocations();
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              case Status.COMPLETED:
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        children: [
                                          RichTextWidget(
                                            textAlign: TextAlign.center,
                                            list: [
                                              TextSpan(
                                                  text: 'Tours in your area',
                                                  style:
                                                      boldTextStyle(size: 20)),
                                              TextSpan(
                                                text: ' Nahu',
                                                style: boldTextStyle(
                                                    color: primaryColor,
                                                    size: 20),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    _getnearbyListView(
                                        viewModel.LocationMain.data?.nearby),
                                    20.height,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          child: Container(
                                            width: 150,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'LOAD MORE',
                                                style: TextStyle(),
                                              ),
                                            ),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              _itemCount += 2;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    20.height,
                                  ],
                                );
                              default:
                            }
                            return Container();
                          }),
                        ),
                      ),
                      Container(
                        child: ChangeNotifierProvider<LocationListVM>(
                          create: (BuildContext context) => viewModel,
                          child: Consumer<LocationListVM>(
                              builder: (context, viewModel, _) {
                            switch (viewModel.LocationMain.status) {
                              case Status.COMPLETED:
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        children: [
                                          RichTextWidget(
                                            textAlign: TextAlign.center,
                                            list: [
                                              TextSpan(
                                                  text: 'Popular',
                                                  style: boldTextStyle(
                                                      size: 20,
                                                      color: primaryColor)),
                                              TextSpan(
                                                text: ' Tour',
                                                style: boldTextStyle(size: 20),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    _getpopularListView(
                                        viewModel.LocationMain.data?.popular),
                                  ],
                                );
                              default:
                            }
                            return Container();
                          }),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getnearbyListView(List<Nearby>? nearbyList) {
    return ListView.builder(
        itemCount: nearbyList?.length == 0 || nearbyList?.length == 1
            ? nearbyList?.length
            : _itemCount,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, position) {
          if (position % 2 == 0 && position + 1 < nearbyList!.length) {
            return _getNearbyListItem(nearbyList[position]);
          } else {
            return _getNearbyListItem(nearbyList![position]);
          }
        });
  }

  Widget _getpopularListView(List<Popular>? popularList) {
    return ListView.builder(
        itemCount: popularList?.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, position) {
          return _getpopularListItem(popularList![position]);
        });
  }

  Widget _getNearbyListItem(Nearby item) {
    return Container(
      width: context.width(),
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  cachedImage(
                    '',
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ).cornerRadiusWithClipRRect(defaultRadius),
                  10.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          8.width,
                          Text('${item.name}', style: boldTextStyle(size: 18)),
                        ],
                      ),
                      8.height,
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(children: [
                                8.width,
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: cachedImage(
                                    item.author!.img,
                                    fit: BoxFit.cover,
                                    width: 18,
                                    height: 18,
                                  ),
                                ),
                                5.width,
                                Text('${item.author!.userName}',
                                    style: boldTextStyle(size: 15)),
                                20.width,
                              ]),
                            ),
                            Container(
                              child: Row(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: cachedImage(
                                    placeholder3,
                                    fit: BoxFit.cover,
                                    width: 18,
                                    height: 18,
                                  ),
                                ),
                                5.width,
                                star.iconImage(color: primaryColor, size: 20),
                                5.width,
                                Text('${item.rating}',
                                    style: boldTextStyle(size: 15)),
                              ]),
                            ),
                          ],
                        ),
                      ),
                      8.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          8.width,
                          coins.iconImage(size: 20),
                          5.width,
                          Text('${item.price} €',
                              style: boldTextStyle(size: 15)),
                          8.width,
                          alarm.iconImage(size: 20),
                          5.width,
                          Text('${item.duration} m',
                              style: boldTextStyle(size: 15)),
                          5.width,
                          arrow.iconImage(size: 20),
                          5.width,
                          Text('${item.distance} km',
                              style: boldTextStyle(size: 15)),
                          24.width,
                        ],
                      ),
                      const Divider(
                        color: appTextSecondaryColor,
                      ),
                    ],
                  ).flexible(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getpopularListItem(Popular item) {
    return Container(
      width: context.width(),
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  cachedImage(
                    '',
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ).cornerRadiusWithClipRRect(defaultRadius),
                  10.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          8.width,
                          Text('${item.name}', style: boldTextStyle(size: 18)),
                        ],
                      ),
                      8.height,
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(children: [
                                8.width,
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: cachedImage(
                                    item.author!.img,
                                    fit: BoxFit.cover,
                                    width: 18,
                                    height: 18,
                                  ),
                                ),
                                5.width,
                                Text('${item.author!.userName}',
                                    style: boldTextStyle(size: 15)),
                                20.width,
                              ]),
                            ),
                            Container(
                              child: Row(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: cachedImage(
                                    placeholder3,
                                    fit: BoxFit.cover,
                                    width: 18,
                                    height: 18,
                                  ),
                                ),
                                5.width,
                                star.iconImage(color: primaryColor, size: 20),
                                5.width,
                                Text('${item.rating}',
                                    style: boldTextStyle(size: 15)),
                              ]),
                            ),
                          ],
                        ),
                      ),
                      8.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          8.width,
                          coins.iconImage(size: 20),
                          5.width,
                          Text('${item.price} €',
                              style: boldTextStyle(size: 15)),
                          8.width,
                          alarm.iconImage(size: 20),
                          5.width,
                          Text('${item.duration} m',
                              style: boldTextStyle(size: 15)),
                          5.width,
                          arrow.iconImage(size: 20),
                          5.width,
                          Text('${item.distance} km',
                              style: boldTextStyle(size: 15)),
                          24.width,
                        ],
                      ),
                      const Divider(
                        color: appTextSecondaryColor,
                      ),
                    ],
                  ).flexible()
                ],
              ),
              16.height
            ],
          ),
        ),
      ),
    );
  }
}
