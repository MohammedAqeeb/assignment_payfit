import 'package:json_annotation/json_annotation.dart';
part 'gym_center.g.dart';

@JsonSerializable(createToJson: false)
class GymCenter {
  final String name, location, image;
  final int price;
  final double distance;

  const GymCenter({
    required this.name,
    required this.location,
    required this.image,
    required this.price,
    required this.distance,
  });

  factory GymCenter.fromJson(Map<String, dynamic> json) =>
      _$GymCenterFromJson(json);
}
