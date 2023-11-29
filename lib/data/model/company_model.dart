import 'package:digital_id/domain/entities/company.dart';

class CompanyModel {
  String name;
  String email;
  String address;
  String phoneNumber;

  CompanyModel({
    required this.name,
    required this.email,
    required this.address,
    required this.phoneNumber,
  });

  factory CompanyModel.fromEntity(Company company) => CompanyModel(
        name: company.name,
        email: company.email,
        address: company.address,
        phoneNumber: company.phoneNumber,
      );

  Company toEntity() {
    return Company(
      name: name,
      email: email,
      address: address,
      phoneNumber: phoneNumber,
    );
  }
}
