class Subject {
  final id;
  final name;

  Subject({
    required this.id,
    required this.name,
  });
  factory Subject.fromJson(json){
    return Subject(id: json['id'], name: json['name']);
  }
}
