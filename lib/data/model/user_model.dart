// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:digital_id/domain/entities/user.dart';

class UserModel {
  int id;
  String name;
  String email;
  String address;
  String role;
  String phoneNumber;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.role,
    required this.phoneNumber,
  });

  factory UserModel.fromEntity(User user) => UserModel(
        id: user.id,
        name: user.name,
        email: user.email,
        address: user.address,
        role: user.role,
        phoneNumber: user.phoneNumber,
      );

  User toEntity() {
    return User(
      id: id,
      name: name,
      email: email,
      address: address,
      role: role,
      phoneNumber: phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'address': address,
      'role': role,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      address: map['address'] as String,
      role: map['role'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
