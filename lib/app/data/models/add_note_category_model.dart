class AddNoteCategoryModel {
  final int id;
  final String name;

  AddNoteCategoryModel({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory AddNoteCategoryModel.fromMap(Map<String, dynamic> map) {
    return AddNoteCategoryModel(
      id: map['id'],
      name: map['name'],
    );
  }
}
