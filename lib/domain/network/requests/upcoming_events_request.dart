class UpcomingEventsRequest {
  final String date;
  final String language;

  UpcomingEventsRequest(this.date, this.language);

  Map<String, dynamic> toJson() => {
        'date': date,
        'language': language,
      };
}
