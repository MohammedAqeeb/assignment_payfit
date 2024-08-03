import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paygo_assignment/services/gym_service.dart';

final gymCenterServicePr = Provider.autoDispose((ref) {
  final service = GymCenterService();
  ref.onDispose(() {
    service.dispose();
  });
  return service;
});

final gymServicePr$ = StreamProvider.autoDispose((ref) {
  final servicePr = ref.watch(gymCenterServicePr);
  servicePr.getGymCenter();
  return servicePr.gymList$;
});
