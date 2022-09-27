import 'package:ticket_app/domain/models/organizer.dart';
import 'event_latlng.dart';
import 'update.dart';

class Event {
  final int id;
  final String title;
  final String details;
  final String image;
  final String genre;
  final String date;
  final String time;
  final List<String> location;
  final List<int> prices;
  final List<int> discountPrices;
  final List<Update> updates;
  final Organizer organizer;
  final EventLatLng eventLatLng;
  final String label;

  Event({
    required this.id,
    required this.title,
    required this.details,
    required this.image,
    required this.genre,
    required this.date,
    required this.time,
    required this.location,
    required this.prices,
    required this.organizer,
    required this.discountPrices,
    required this.updates,
    required this.eventLatLng,
    required this.label,
  });

  Event.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        details = json['details'],
        image = json['image'],
        genre = json['genre'],
        date = json['date'],
        time = json['time'],
        location = (json['location'] as List<dynamic>)
            .map((e) => e.toString())
            .toList(),
        organizer = Organizer.fromJson(json['organizer']),
        prices = (json['prices'] as List<dynamic>)
            .map((e) => int.parse(e.toString()))
            .toList(),
        discountPrices = (json['discountPrices'] as List<dynamic>)
            .map((e) => int.parse(e.toString()))
            .toList(),
        updates = (json['updates'] as List<dynamic>?)!
            .map((updateMap) =>
                Update.fromJson(updateMap as Map<String, dynamic>))
            .toList(),
        label = json['label'],
        eventLatLng = EventLatLng.fromJson(json['latlng']);
}
