class Post {
  int id;
  int userId;
  String textBody;
  String timeAgo;
  List<String> postImage;
  int likes;
  int comments;
  int shares;

  Post({
    required this.id,
    required this.userId,
    required this.timeAgo,
    required this.textBody,
    required this.postImage,
    required this.likes,
    required this.comments,
    required this.shares,
  });
}
