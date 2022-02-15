class Post {
  int id;
  String author;
  String content;
  int likes;
  int comment;
  bool isLike;

  Post(
      {required this.id,
      required this.author,
      required this.content,
      required this.likes,
      required this.comment,
      this.isLike = true});
}
