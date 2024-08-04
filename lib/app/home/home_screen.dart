import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:paygo_assignment/app/details/detail_screen.dart';
import 'package:paygo_assignment/app/home/logic/location_handler.dart';
import 'package:paygo_assignment/app/home/widgets/home_gym_preview.dart';
import 'package:paygo_assignment/constants/colors.dart';
import 'package:paygo_assignment/constants/images.dart';
import 'package:paygo_assignment/constants/styles.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Future<Map<String, String>?>? _currentLocation;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _currentLocation = LocationHandler.getAddressFromLatLng();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBar(
              backgroundColor: appBarColor,
              elevation: 0,
              flexibleSpace: Column(
                children: [
                  Container(
                    color: appBarColor,
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(flex: 33, child: locationBuilder(context)),
                        Flexible(flex: 38, child: buildPointsWidget()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Remaining content
            Expanded(
              child: CustomScrollView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                slivers: [
                  SliverAppBar(
                    floating: false,
                    pinned: false,
                    snap: false,
                    centerTitle: false,
                    backgroundColor: appBarColor,
                    elevation: 0,
                    expandedHeight: 250,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: false,
                      titlePadding: const EdgeInsets.only(
                        bottom: 16,
                        left: 20,
                        right: 20,
                        top: 8,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Hello, Aqeeb!',
                            style: headLineText1.copyWith(fontSize: 20),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'What Would you Like\n to do Today',
                            style: headLineTextPopins1,
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            alignment: Alignment.center,
                            height: 30,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(26),
                                left: Radius.circular(26),
                              ),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                    FluentSystemIcons.ic_fluent_search_filled,
                                    color: Colors.grey),
                                const SizedBox(width: 5),
                                Text(
                                  'Find a nearby activity',
                                  style: labelText.copyWith(
                                    fontSize: 10,
                                    color: const Color.fromRGBO(
                                        102, 112, 133, 0.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(30),
                      ),
                    ),
                  ),
                  buildBody(),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    // return CustomScrollView(

    //   slivers: [
    //     SliverAppBar(
    //       floating: false,
    //       pinned: false,
    //       snap: false,
    //       centerTitle: true,
    //       backgroundColor: appBarColor,
    //       elevation: 0,
    //       expandedHeight: 250,
    //       flexibleSpace: FlexibleSpaceBar(
    //         centerTitle: true,
    //         titlePadding:
    //             const EdgeInsets.only(bottom: 16, left: 16, right: 12, top: 10),
    //         title: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             Text(
    //               'Hi Aqeeb',
    //               style: headLineText1,
    //             ),
    //             Text(
    //               'What Would you Like\n to do Today',
    //               style: headLineTextPopins1,
    //             ),
    //             Container(
    //               margin: const EdgeInsets.only(top: 14),
    //               height: 30,
    //               width: MediaQuery.of(context).copyWith().size.width,
    //               decoration: const BoxDecoration(
    //                 borderRadius: BorderRadius.horizontal(
    //                   right: Radius.circular(26),
    //                   left: Radius.circular(26),
    //                 ),
    //                 color: Colors.white,
    //               ),
    //               child: Row(
    //                 children: [
    //                   const Icon(Icons.search, color: Colors.grey),
    //                   const SizedBox(width: 5),
    //                   Text(
    //                     'Find nearby activity',
    //                     style: labelText.copyWith(fontSize: 12),
    //                   ),
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //       title: Padding(
    //         padding: const EdgeInsets.only(top: 14, left: 12, right: 12),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Flexible(flex: 33, child: locationBuilder(context)),
    //                 Flexible(flex: 38, child: buildPointsWidget()),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //       shape: const RoundedRectangleBorder(
    //         borderRadius: BorderRadius.vertical(
    //           bottom: Radius.circular(30),
    //         ),
    //       ),
    //     ),
    //     buildBody(),
    //   ],
    // );
  }

  Widget buildBody() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const SizedBox(height: 20),
          _buildGridView(),
          const HomeGymPreview(
            gymName: 'Planet Aqua Pool',
            location: 'BTM Layout, Bengaluru,',
            image: swimmingPreview1,
            distance: 6.5,
            price: 200,
          ),
          const SizedBox(height: 8),
          const HomeGymPreview(
            gymName: 'Universal Yoga',
            location: 'Thrissur, Kerala',
            image: yogaPreview1,
            distance: 2.3,
            price: 350,
          ),
          const SizedBox(height: 8),
          const HomeGymPreview(
            gymName: 'Infinite Fitness Studio',
            location: 'West Marredpally, Hyderabad',
            image: gymHomePreviewImage1,
            distance: 16.3,
            price: 600,
          ),
        ],
      ),
    );
  }

  Widget locationBuilder(BuildContext context) {
    return FutureBuilder<Map<String, String>?>(
      future: _currentLocation,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildShimmerEffect();
        } else {
          if (snapshot.hasData && snapshot.data != null) {
            final currentAddress = snapshot.data!;
            return buildUserLocation(
                currentAddress['locality']!, currentAddress['fullAddress']!);
          } else {
            return Text(
              'Failed to fetch address',
              style: labelText,
            );
          }
        }
      },
    );
  }

  Widget _buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: greyTextColor,
      highlightColor: appBarTextColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200.0,
            height: 20.0,
            color: Colors.white,
          ),
          const SizedBox(height: 10),
          Container(
            width: 300.0,
            height: 20.0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget buildUserLocation(String location, String fullAddress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              location,
              style: labelText.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(36, 36, 36, 1)),
              overflow: TextOverflow.ellipsis,
            ),
            const Icon(
              Icons.keyboard_arrow_down_sharp,
              color: greyTextColor,
              size: 20,
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          fullAddress,
          maxLines: 1,
          style: labelText.copyWith(fontWeight: FontWeight.w400),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget buildPointsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(coinLogo),
                ),
              ),
            ),
            const SizedBox(width: 4),
            Text(
              'Points',
              style: labelText.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w200,
                color: const Color.fromRGBO(36, 36, 36, 1),
              ),
            ),
          ],
        ),
        Text(
          '3,725',
          style: labelText.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: const Color.fromRGBO(36, 36, 36, 1),
          ),
        ),
      ],
    );
  }

  Widget _buildGridView() {
    return GridView(
      padding: const EdgeInsets.only(left: 30, right: 30),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 30,
        childAspectRatio: 50,
        mainAxisExtent: 80,
      ),
      children: [
        buildLogo(iconImage: gymLogo, iconName: 'Gym', showLogo: true),
        buildLogo(iconImage: swimLogo, iconName: 'Swimming', showLogo: true),
        buildLogo(
            iconImage: badmintonLogo, iconName: 'Badminton', showLogo: true),
        buildLogo(iconImage: yogaLogo, iconName: 'Yoga', showLogo: true),
        buildLogo(iconImage: zumbaLogo, iconName: 'Zumba', showLogo: true),
        buildLogo(iconImage: '', iconName: 'View all', showLogo: false),
      ],
    );
  }

  Widget buildLogo({
    required String iconImage,
    required String iconName,
    required bool showLogo,
  }) {
    return SizedBox(
      height: 50,
      width: 50,
      child: GestureDetector(
        onTap: () {
          _currentLocation?.then((locationData) {
            if (locationData != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    locality: locationData['locality'] ?? 'Unknown',
                    fullAddress: locationData['fullAddress'] ?? 'Unknown',
                  ),
                ),
              );
            } else {
              // Handle the case where locationData is null
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Failed to fetch address'),
                ),
              );
            }
          });

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const DetailScreen(),
          //   ),
          // );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (showLogo)
              Expanded(
                child: Image.asset(
                  iconImage,
                ),
              ),
            showLogo == true
                ? Text(iconName, style: labelText)
                : Text(
                    iconName,
                    style: labelText.copyWith(
                      color: purpleColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
