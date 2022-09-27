class EventsRequest {
  final String language;

  EventsRequest(this.language);

  Map<String, dynamic> toJson() => {'language': language};

}

