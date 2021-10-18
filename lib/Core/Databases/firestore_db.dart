import 'package:book_app/Models/book.dart';
import 'package:book_app/Utils/app_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreDB {
  String dbName = "favouritesCollection";

  late FirebaseFirestore favDB;

  FireStoreDB() {
    favDB = FirebaseFirestore.instance;
  }

  Future<void> postBook(Book w, String userId) async {
    try {
      await favDB.collection(dbName).add({
        "bookDetails": w.toJson(),
        "user": userId,
        "id": w.id,
        "createdAt": FieldValue.serverTimestamp()
      });
      AppUtils.showToast(message: "Successfully Added");
    } catch (e) {}
  }

  Future<void> deleteBook(Book w, String userId) async {
    try {
      var docSnapshot = await favDB
          .collection(dbName)
          .where("id", isEqualTo: w.id!)
          .where("user", isEqualTo: userId)
          .get();

      for (var doc in docSnapshot.docs) {
        await doc.reference.delete();
      }
      AppUtils.showToast(message: "Successfully Removed");
    } catch (e) {
      rethrow;
    }
  }
}
