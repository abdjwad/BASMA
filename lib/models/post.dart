class Post{
  final id;
  final user_name;
  final likeCount;
  final category;
  final String text;
  final String image;
  final state;
  Post({
    required this.id,
  required this.text,
  required this.image,
    required this.category,
    required this.likeCount,
    required this.user_name,
    required this.state

  });
  factory Post.fromJson(json){
  return Post(
    id: json['id'],
      text: json['text'],
      image: json['image'],
      category: json['post_category'],
      likeCount: json['like'],
      user_name: json['user']['name']
      ,state: json["state"]
  );
  }

}