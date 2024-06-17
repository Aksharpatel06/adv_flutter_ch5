class CompanyModal {
  String name;
  String catchPhrase;
  String bs;

  CompanyModal(
      {required this.name, required this.catchPhrase, required this.bs});

  factory CompanyModal.fromJson(Map json) {
    return CompanyModal(
        name: json['name'], catchPhrase: json['catchPhrase'], bs: json['bs']);
  }
}