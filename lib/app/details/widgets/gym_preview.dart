import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paygo_assignment/constants/colors.dart';
import 'package:paygo_assignment/constants/styles.dart';
import 'package:paygo_assignment/models/gym_center.dart';

class GymPreviewScreen extends StatelessWidget {
  final GymCenter gym;
  const GymPreviewScreen({
    required this.gym,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13, right: 13, top: 6, bottom: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 360,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildImageCard(context),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        gym.name,
                        style: headLineText1.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(25, 29, 35, 1),
                        ),
                      ),
                      Text(
                        gym.location,
                        style: labelText.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(105, 105, 105, 1),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '~  ${gym.distance}',
                    style: labelText.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(105, 105, 105, 1),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 8),
              child: Divider(
                color: greyTextColor,
                thickness: 0.9,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\u{20B9} ${gym.price}/ session',
                    style: headLineText1.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(25, 29, 35, 1),
                    ),
                  ),
                  Text(
                    'Book Slot',
                    style: labelText.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: purpleColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImageCard(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 245,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                  // 'https://www.hussle.com/blog/wp-content/uploads/2020/12/Gym-structure-1080x675.png',
                  gym.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(
              Icons.favorite_border,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
