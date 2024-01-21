import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat_demo/constants/firestore_constants.dart';

class HomeProvider {
  final FirebaseFirestore firebaseFirestore;

  HomeProvider({required this.firebaseFirestore});

  Future<void> updateDataFirestore(
      String collectionPath, String path, Map<String, String> dataNeedUpdate) {
    return firebaseFirestore
        .collection(collectionPath)
        .doc(path)
        .update(dataNeedUpdate);
  }

  // Stream<QuerySnapshot> getStreamFireStore(
  //     String pathCollection, int limit, String? textSearch) {
  //   if (textSearch?.isNotEmpty == true) {
  //     return firebaseFirestore.collection(pathCollection).limit(limit).where(
  //         FirestoreConstants.nickname,
  //         arrayContains: [textSearch]).snapshots();
  //   } else {
  //     return firebaseFirestore
  //         .collection(pathCollection)
  //         .limit(limit)
  //         .snapshots();
  //   }
  // }
  Stream<QuerySnapshot> getStreamFireStore(
      String pathCollection, int limit, String? textSearch) {
    if (textSearch?.isNotEmpty == true) {
      return firebaseFirestore
          .collection(pathCollection)
          .limit(limit)
          .orderBy(FirestoreConstants.nickname)
          .startAt([textSearch]).endAt([textSearch! + '\uf8ff']).snapshots();
    } else {
      return firebaseFirestore
          .collection(pathCollection)
          .limit(limit)
          .snapshots();
    }
  }
}
