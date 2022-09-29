class EventLatLng {
  final double lat;
  final double lng;

  EventLatLng({
    required this.lat,
    required this.lng,
  });

  factory EventLatLng.fromJson(Map<String, dynamic> json) {
    return EventLatLng(
      lat: json['lat'] as double,
      lng: json['lng'] as double,
    );
  }
}
