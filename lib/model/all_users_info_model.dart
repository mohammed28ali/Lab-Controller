import 'package:cloud_firestore/cloud_firestore.dart';

class UsersInfoModel{
      String? email;
      String? name;
      String? pic;
      String? id;
      String? nationality;
      String? address;
      String? homeNum;
      String? phoneNum;
      String? role;
      String? gender;

  UsersInfoModel({
       required this.email,
       required this.name,
       required this.pic,
       required this.id,
       required this.nationality,
       required this.address,
       required this.homeNum,
       required this.phoneNum,
       required this.role,
       required this.gender});

  UsersInfoModel.fromMap(DocumentSnapshot data){
    email=data['email'];
    name=data['name'];
    pic=data['pic'];
    id=data['id'];
    nationality=data['nationality'];
    homeNum=data['homeNum'];
    phoneNum=data['phoneNum'];
    role=data['role'];
    gender=data['gender'];
  }
}