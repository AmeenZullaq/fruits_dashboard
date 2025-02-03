import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_dashboard/core/services/database_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
  }) async {
    if (documentId != null) {
      var data = await firestore.collection(path).doc(documentId).get();
      return data.data() as Map<String, dynamic>;
    } else {
      List<Map<String, dynamic>> docs = [];
      var data = await firestore.collection(path).get();
      data.docs.map(
        (doc) => docs.add(doc.data()),
      );
      return docs;
    }
  }

  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String docuementId,
  }) async {
    final data = await firestore.collection(path).doc(docuementId).get();
    return data.exists;
  }
}
