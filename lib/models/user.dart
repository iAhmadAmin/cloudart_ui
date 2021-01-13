import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  final String firstName;
  final String lastName;
  final String email;
  final String photoUrl;
  final String artistName;
  final String password;

  MyUser({
    this.password,
    this.firstName,
    this.email,
    this.photoUrl,
    this.lastName,
    this.artistName,
  });

  factory MyUser.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data as Map<String, dynamic>;
    return MyUser(
      email: data['email'],
      firstName: data['firstName'],
      photoUrl: data['photoUrl'],
      lastName: data['lastName'],
      artistName: data['artistName'],
      password: data['password'],
    );
  }
}
