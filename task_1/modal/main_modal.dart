import 'address_modal.dart';
import 'company_modal.dart';
class MainModal {
  int id;
  String username;
  String email;
  String name;
  String phone;
  String website;

  AddressModal addressModal;

  CompanyModal companyModal;

  MainModal(
      {required this.id,
      required this.name,
      required this.email,
      required this.username,
      required this.phone,
      required this.website,
      required this.addressModal,
      required this.companyModal});


  factory MainModal.fromJson(Map json) {
    return MainModal(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
      phone: json['phone'],
      website: json['website'],
      addressModal: AddressModal.fromJson(json['address']),
      companyModal: CompanyModal.fromJson(json['company']),
    );
  }
}