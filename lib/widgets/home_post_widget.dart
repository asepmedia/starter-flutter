import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/post_provider.dart';
import 'package:todoapp/utils/screen_helper.dart';

class HomePostWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var scale = ScreenHelper.scale(context);
    var height = ScreenHelper.fontSize(ScreenHelper.height(context), scale);
    var sizeContainer = ScreenHelper.percentOf(height, 80);

    return Consumer<PostProvider>(builder: ((context, postProvider, child) {
      return ListView.builder(
          itemCount: postProvider.posts.length,
          itemBuilder: ((context, index) {
            var post = postProvider.posts[index];
            return Column(
              children: [
                Card(
                  child: Container(
                    padding: EdgeInsets.all(ScreenHelper.fontSize(10, scale)),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.author,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenHelper.fontSize(18, scale)),
                        ),
                        SizedBox(
                          height: ScreenHelper.fontSize(10, scale),
                        ),
                        Text(
                          post.content,
                          style: TextStyle(
                              fontSize: ScreenHelper.fontSize(16, scale)),
                        ),
                        SizedBox(
                          height: ScreenHelper.fontSize(10, scale),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                post.likes > 0
                                    ? "${post.likes} Suka"
                                    : "Belum Disukai",
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "${post.comment} Komentar",
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print("Like aja");
                                  postProvider.toggleLiked(post.id);
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      !post.isLike
                                          ? Icons.thumb_up_outlined
                                          : Icons.thumb_up,
                                      color: post.isLike
                                          ? Color(0xFF1A237E)
                                          : Colors.black,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Suka",
                                      style: TextStyle(
                                          color: post.isLike
                                              ? Color(0xFF1A237E)
                                              : Colors.black,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                              Row(),
                              Row(
                                children: const [
                                  Icon(Icons.comment_outlined),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Komentar",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }));
    }));
  }
}
