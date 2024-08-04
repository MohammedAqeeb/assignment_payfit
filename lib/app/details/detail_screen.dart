import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paygo_assignment/app/details/provider.dart';
import 'package:paygo_assignment/app/details/widgets/gym_preview.dart';
import 'package:paygo_assignment/app/details/widgets/tab_button.dart';
import 'package:paygo_assignment/constants/colors.dart';
import 'package:paygo_assignment/constants/styles.dart';
import 'package:paygo_assignment/models/gym_center.dart';

class DetailScreen extends ConsumerStatefulWidget {
  final String locality;
  final String fullAddress;
  const DetailScreen({
    required this.locality,
    required this.fullAddress,
    super.key,
  });

  @override
  DetailScreenState createState() => DetailScreenState();
}

class DetailScreenState extends ConsumerState<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 14, left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.locality,
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
                widget.fullAddress,
                maxLines: 1,
                style: labelText.copyWith(fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildButtons(context),
            const SizedBox(height: 10),
            buildGymCenter(),
          ],
        ),
      ),
    );
  }

  Widget buildGymCenter() {
    final gymPr$ = ref.watch(gymServicePr$);
    return gymPr$.when(
      data: (data) {
        if (data.isNotEmpty) {
          return _buildGymListView(data);
        } else {
          return Center(
            child: Text(
              'No data Available',
              style: labelText,
            ),
          );
        }
      },
      error: (_, __) => const Text('SomeThing went wrong'),
      loading: () => const CircularProgressIndicator(
        color: greyTextColor,
      ),
    );
  }

  Widget _buildGymListView(List<GymCenter> gymCenter) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: gymCenter.length,
      itemBuilder: (context, index) {
        final gym = gymCenter[index];
        return GymPreviewScreen(
          gym: gym,
        );
      },
    );
  }
}
