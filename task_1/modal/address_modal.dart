import 'geo_modal.dart';
class AddressModal {
  String street;
  String suite;
  String city;
  String zipcode;

  GeoModal geoModal;

  AddressModal({
    required this.street,
    required this.city,
    required this.suite,
    required this.zipcode,
    required this.geoModal,
  });

  factory AddressModal.fromJson(Map json) {
    return AddressModal(
        street: json['street'],
        city: json['city'],
        suite: json['suite'],
        zipcode: json['zipcode'],
        geoModal: GeoModal.fromJson(json['geo']),
    );
  }
}
