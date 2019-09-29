import 'package:firebase_database/firebase_database.dart';

class UserServices {
  FirebaseDatabase _database = FirebaseDatabase.instance;
  String ref = "users";

  createUser(Map value) {
    String id = value["userId"];
    _database.reference().child("$ref/$id").set(value).catchError(
          (e) => print(
            e.toString(),
          ),
        );
  }
}

//void createRecord(){
//  databaseReference.child("1").set({
//    'title': 'Mastering EJB',
//    'description': 'Programming Guide for J2EE'
//  });
//  databaseReference.child("2").set({
//    'title': 'Flutter in Action',
//    'description': 'Complete Programming Guide to learn Flutter'
//  });
//}

//import 'package:firebase_database/firebase_database.dart';
//
//class UsersServices {
//  FirebaseDatabase _database = FirebaseDatabase.instance;
//  String ref = 'users';
//
//  createUser(Map value) {
//    _database
//        .reference()
//        .child(
//          ref.toString(),
//        )
//        .push()
//        .set(value)
//        .catchError(
//          (e) => print(
//            "WHATS WRONG? " + e.toString(),
//          ),
//        );
//  }
//}
