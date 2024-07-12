class PostModel {
  final int id;
  final int userId;
  final String body;
  final String title;

  PostModel({
    required this.id,
    required this.body,
    required this.title,
    required this.userId,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      body: json['body'],
      title: json['title'],
      userId: json['userId'],
    );
  }
}
