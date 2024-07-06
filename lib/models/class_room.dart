class ClassRoom {
  final id;
  final name;

  ClassRoom({
    required this.id,
    required this.name,
  });
  factory ClassRoom.fromJson(json){
    return ClassRoom(id: json['id'], name: json['name']);
  }
}
