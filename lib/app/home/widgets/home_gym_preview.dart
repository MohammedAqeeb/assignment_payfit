import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/styles.dart';

class HomeGymPreview extends StatelessWidget {
  final String gymName;
  final String location;
  final String image;
  final double distance;
  final int price;
  const HomeGymPreview({
    super.key,
    required this.gymName,
    required this.location,
    required this.image,
    required this.distance,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 14,
        right: 14,
        top: 20,
        bottom: 14,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 370,
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
            buildGymNameLocationCard(),
            buildLine(),
            buildSlotCard(),
          ],
        ),
      ),
    );
  }

  Widget buildLine() {
    return const Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 8),
      child: Divider(
        color: greyTextColor,
        thickness: 0.9,
      ),
    );
  }

  Widget buildSlotCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\u{20B9} $price/ session',
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
    );
  }

  Padding buildGymNameLocationCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                gymName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: headLineText1.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(25, 29, 35, 1),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                location,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: labelText.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(105, 105, 105, 1),
                ),
              ),
            ],
          ),
          Text(
            '~  $distance km',
            style: labelText.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(105, 105, 105, 1),
            ),
          ),
        ],
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
              image: AssetImage(
                image,
              ),
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
