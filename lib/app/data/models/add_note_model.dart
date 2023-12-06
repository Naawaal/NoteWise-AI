class AddNoteModel {
  final int id;
  final String title;
  final String note;
  final String category;
  final String date;

  AddNoteModel({
    required this.id,
    required this.title,
    required this.note,
    required this.category,
    required this.date,
  });

  factory AddNoteModel.fromJson(Map<String, dynamic> json) {
    return AddNoteModel(
      id: json['id'],
      title: json['title'],
      note: json['note'],
      category: json['category'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'note': note,
      'category': category,
      'date': date,
    };
  }
}
