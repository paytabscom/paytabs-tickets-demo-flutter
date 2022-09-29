class Update {
  final int id;
  final String date;
  final String contents;

  Update({
    required this.id,
    required this.date,
    required this.contents,
  });

  Update.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        date = json['date'],
        contents = json['contents'];
}
