import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paygo_assignment/models/gym_center.dart';
import 'package:rxdart/rxdart.dart';

class GymCenterService {
  final db = FirebaseFirestore.instance;

  final BehaviorSubject<List<GymCenter>> gymCenter =
      BehaviorSubject<List<GymCenter>>();

  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? streamSubscription;

  void getGymCenter() {
    print('Service called');
    List<GymCenter> gymList = [];

    streamSubscription = db
        .collection('gym')
        .orderBy('distance', descending: true)
        .snapshots()
        .listen(
      (value) {
        gymList.clear();
        if (value.docs.isNotEmpty) {
          for (var doc in value.docs) {
            print('data inside');
            print(doc.data());
            gymList.add(GymCenter.fromJson(doc.data()));
            gymCenter.sink.add(gymList);
          }
        }
      },
    );
  }

  Stream<List<GymCenter>> get gymList$ => gymCenter.stream;

  void dispose() {
    gymCenter.close();
    streamSubscription!.cancel();
  }
}
