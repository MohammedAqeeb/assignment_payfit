// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gym_center.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GymCenter _$GymCenterFromJson(Map<String, dynamic> json) => GymCenter(
      name: json['name'] as String,
      location: json['location'] as String,
      image: json['image'] as String,
      price: (json['price'] as num).toInt(),
      distance: (json['distance'] as num).toDouble(),
    );
