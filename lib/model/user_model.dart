import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String userId, email, name, pic,id,nationality,address,homeNum,phoneNum,role,gender;


  UserModel({
    required this.userId,
    required this.email,
    required this.name,
    required this.pic,
    required this.id,
    required this.nationality,
    required this.address,
    required this.homeNum,
    required this.phoneNum,
    required this.role,
    required this.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      userId: json["userId"],
      name: json["name"],
      pic: json["pic"],
      id: json["id"],
      homeNum: json["homeNum"],
      phoneNum: json["phoneNum"],
      role: json["role"],
      email:json["email"],
      nationality: json["nationality"],
      address: json["address"],
      gender: json["gender"]);

  // fromJson(Map<dynamic, dynamic> map) {
  //   if (map == null) {
  //     return;
  //   }
  //   userId = map['userId'];
  //   email = map['email'];
  //   name = map['name'];
  //   pic = map['pic'];
  //   id = map['id'];
  //   nationality = map['nationality'];
  //   address = map['address'];
  //   phoneNum = map['phoneNum'];
  //   homeNum = map['homeNum'];
  //   role = map['role'];
  //   gender = map['gender'];
  // }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
      'id': id,
      'nationality': nationality,
      'address': address,
      'phoneNum': phoneNum,
      'homeNum': homeNum,
      'role': role,
      'gender': gender,
    };
  }

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      email: snapshot['email'],
      pic: snapshot['pic'],
      userId: snapshot['userId'],
      name: snapshot['name'],
      id: snapshot['id'],
      nationality: snapshot['nationality'],
      address: snapshot['nationality'],
      homeNum: snapshot['homeNum'],
      phoneNum: snapshot['nationality'],
      role: snapshot['phoneNum'],
      gender: snapshot['gender'],
    );
  }
}