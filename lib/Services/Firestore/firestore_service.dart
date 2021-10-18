import 'package:book_app/Core/Databases/firestore_db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  FireStoreDB db = new FireStoreDB();

  Stream<QuerySnapshot<Map<String, dynamic>>> streamFavourites(User user) {
    return db.favDB
        .collection(db.dbName)
        .where('user', isEqualTo: user.uid)
        .orderBy("createdAt", descending: true)
        .snapshots();
  }
}
