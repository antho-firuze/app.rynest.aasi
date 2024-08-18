class Gps {
  Gps({
    required this.lng,
    required this.lat,
    this.city,
  });

  double lng;
  double lat;
  String? city;

  Gps.defaultValue()
      : lat = -6.385589,
        lng = 106.830711,
        city = 'Kota Depok';

  factory Gps.fromJson(Map<String, dynamic> json) => Gps(
        lng: json['lng'] ?? 106.830711,
        lat: json['lat'] ?? -6.385589,
        city: json['city'] ?? 'Kota Depok',
      );

  Map<String, dynamic> toJson() => {"lng": lng, "lat": lat};

  String toParams() => "$lng,$lat";
}
