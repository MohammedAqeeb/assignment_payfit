import 'package:flutter/material.dart';

import 'package:paygo_assignment/constants/colors.dart';
import 'package:paygo_assignment/constants/styles.dart';

Widget buildButtons(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 12, bottom: 12, top: 12),
    child: SizedBox(
      height: 34,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          buildTabButtons(context, 'Gym'),
          const SizedBox(width: 12),
          buildTabButtons(context, 'Swimming'),
          const SizedBox(width: 12),
          buildTabButtons(context, 'Cricket'),
          const SizedBox(width: 12),
          buildTabButtons(context, 'Yoga'),
          const SizedBox(width: 12),
          buildTabButtons(context, 'Zumba'),
        ],
      ),
    ),
  );
}

Widget buildTabButtons(
  BuildContext context,
  String textName,
) {
  return OutlinedButton(
    style: OutlinedButton.styleFrom(
      minimumSize: const Size(66, 34),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: greyTextColor,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      foregroundColor: purpleColor,
    ),
    onPressed: () {},
    child: Text(
      textName,
      style: headLineText1,
    ),
  );
}
