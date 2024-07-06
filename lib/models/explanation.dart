class Explanation {
  final id;

  final user_id;
  final order_explanation_id;
  final title_id;
  final title;
  final state;
  final video;

  Explanation(
      {required this.id,
      required this.user_id,
      required this.title_id,
      required this.state,
      required this.title,
      required this.order_explanation_id,
      required this.video});

  factory Explanation.fromJson(json) {
    return Explanation(
      id: json['id'],
      user_id: json['user_id'],
      title_id: json['title_id'],
      state: json['state'],
      title: json['title'],
      order_explanation_id: json['order_explanation_id'],
      video: json['video']??"",
    );
  }
}
