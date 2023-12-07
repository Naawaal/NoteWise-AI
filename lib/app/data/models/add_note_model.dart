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

  // Convert AddNoteModel to a Map for database operations
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'note': note,
      'category': category,
      'date': date,
    };
  }

  // Convert a Map to an AddNoteModel
  factory AddNoteModel.fromMap(Map<String, dynamic> map) {
    return AddNoteModel(
      id: map['id'],
      title: map['title'],
      note: map['note'],
      category: map['category'],
      date: map['date'],
    );
  }
}
