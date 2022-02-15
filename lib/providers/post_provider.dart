import 'package:flutter/material.dart';
import 'package:todoapp/models/post.dart';

class PostProvider with ChangeNotifier {
  List<Post> _posts = [
    Post(
        id: 1,
        author: "Asep Yayat",
        content: "Percikan air mungkin saja dapat membasahi jika terkena :D",
        likes: 10,
        comment: 1,
        isLike: false),
    Post(
        id: 2,
        author: "Destina",
        content: "Yang di atas adalah orang",
        likes: 1,
        comment: 0),
    Post(id: 3, author: "Asep", content: "Apa Saja", likes: 10, comment: 1),
    Post(
        id: 4,
        author: "Destina",
        content: "Masih sama juga",
        likes: 1,
        comment: 0),
    Post(id: 5, author: "Yayat", content: "Menuju Senja", likes: 1, comment: 0),
    Post(
        id: 6,
        author: "Asep",
        content: "Apa saja bisa dilakukan",
        likes: 10,
        comment: 1),
  ];

  List<Post> get posts {
    return _posts;
  }

  void toggleLiked(int id) {
    Post post = _posts.firstWhere((e) => e.id == id);
    post.isLike = !post.isLike;

    if (!post.isLike) {
      post.likes--;
    } else {
      post.likes++;
    }
    notifyListeners();
  }
}
