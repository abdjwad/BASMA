class title {
  final id;
  final name;
   final subject_class_id;
  title({
    required this.id,
    required this.name,
    required this.subject_class_id
  });
  factory title.fromJson(json){
    return title(id: json['id'], name: json['name'],subject_class_id: json['subject_class_id']);
  }
}
