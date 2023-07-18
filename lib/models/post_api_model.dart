class PostAPI {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostAPI({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostAPI.fromMap({required Map data}) {
    return PostAPI(
      userId: data['userId'],
      id: data['id'],
      title: data['title'],
      body: data['body'],
    );
  }
}
