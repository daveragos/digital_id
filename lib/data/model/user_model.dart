import 'package:digital_id/domain/entities/user.dart';

class UserModel {
  String name;
  String email;
  String address;
  String role;
  String phoneNumber;

  UserModel({
    required this.name,
    required this.email,
    required this.address,
    required this.role,
    required this.phoneNumber,
  });

  factory UserModel.fromEntity(User user) => UserModel(
        name: user.name,
        email: user.email,
        address: user.address,
        role: user.role,
        phoneNumber: user.phoneNumber,
      );

  User toEntity() {
    return User(
      name: name,
      email: email,
      address: address,
      role: role,
      phoneNumber: phoneNumber,
    );
  }
}
