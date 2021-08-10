class Notes {
  int id;
  String title;
  String content;
  int colorIndex;
  DateTime dateTime;

  Notes({this.colorIndex, this.content, this.title, this.id, this.dateTime});

  factory Notes.fromMap(Map<String, dynamic> map) => Notes(
        id: map['id'],
        title: map['title'],
        colorIndex: map['colorIndex'],
        content: map['content'],
        dateTime: DateTime.parse(map['dateTime']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'colorIndex': colorIndex,
        'content': content,
        'dateTime': dateTime.toString(),
      };
}

class required {}
