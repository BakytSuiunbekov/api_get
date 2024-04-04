class CommentModel {
  const CommentModel({
    required this.body,
    required this.email,
    required this.id,
    required this.name,
    required this.postId,
  });

  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;
}
