import '../../models/upcoming_events.dart';

class UpcomingEventsResponse {
  final int status;
  final String message;
  final List<UpcomingEvents> upcomingevents;

  UpcomingEventsResponse(this.status, this.message, this.upcomingevents);

  UpcomingEventsResponse.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        upcomingevents = (json['upcomingevents'] as List<dynamic>?)!
            .map((eventMap) =>
                UpcomingEvents.fromJson(eventMap as Map<String, dynamic>))
            .toList();
}
