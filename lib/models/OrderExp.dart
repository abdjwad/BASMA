class OrderExp {
  final id;

  final user_id;
  final subject_class_id;
  final title_id;
  final note;
  final state;
  final approvals;

  OrderExp(
      {required this.id,

      required this.subject_class_id,
      required this.state,
      required this.approvals,
      required this.note,
      required this.title_id,
      required this.user_id});

  factory OrderExp.fromJson(json) {
    return OrderExp(
      id: json['id'],

      subject_class_id: json['subject_class_id'],
      approvals: json['approvals'],
      note: json['note'],
      state: json['state'],
      title_id: json['title_id'],
      user_id: json['user_id'],
    );
  }
}
