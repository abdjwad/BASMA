import 'package:basma/components/palette.dart';
import 'package:basma/models/post.dart';
import 'package:basma/provider/PostProvider%20.dart';
import 'package:basma/screens/homePage/componants/info_about_basma.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(builder: (context, postProvider, child) {
      return Container(
        child: ListView.builder(
          itemBuilder: (_, i) {
            Post post = postProvider.posts[i];
            return PostCard(
              username: post.user_name,
              category: post.category,
              postImage: post.image,
              postText: post.text,
              likeCount: post.likeCount,
              id: post.id,
            );
          },
          itemCount: postProvider.posts.length,
        ),
      );
    });
  }
}

class PostCard extends StatelessWidget {
  final String username;
  final String postImage;
  final String postText;
  final String category;
  final int likeCount;
  final id;

  PostCard({
    required this.username,
    required this.category,
    required this.postImage,
    required this.postText,
    required this.likeCount,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(builder: (context, postProvider, child) {
      return Container(
        margin: EdgeInsets.all(9),
        child: Card(
          color: Color(0xFF50c1eb),
          surfaceTintColor: Color(0xFF98c242),
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: Text(username),
                subtitle: Text(category),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(postText),
              ),
              Image.network(postImage),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    LikeButton(
                      size: 30,
                      isLiked: postProvider.isLike(id),
                      likeCount: likeCount,
                      onTap: (f) async {
                        if (f == true) {
                          postProvider.likePost(id);
                        } else {
                          postProvider.dislikePost(id);
                        }
                        return !f;
                      },
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Info()));
                        },
                        icon: Icon(
                          Icons.clean_hands_outlined,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
