class GeoModal {
  String lat;
  String lng;

  GeoModal({required this.lat, required this.lng});

  factory GeoModal.fromJson(Map json) {
    return GeoModal(lat: json['lat'], lng: json['lng']);
  }
}