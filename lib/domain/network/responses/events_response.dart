import '../../models/event.dart';

class EventsResponse {
  final int status;
  final String message;
  final List<Event> events;

  EventsResponse(this.status, this.message, this.events);

  EventsResponse.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        events = (json['events'] as List<dynamic>?)!
            .map((eventMap) => Event.fromJson(eventMap as Map<String, dynamic>))
            .toList();
}
