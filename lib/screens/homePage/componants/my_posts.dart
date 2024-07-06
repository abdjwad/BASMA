import 'package:basma/components/palette.dart';
import 'package:basma/models/post.dart';
import 'package:basma/provider/PostProvider%20.dart';
import 'package:basma/screens/homePage/componants/info_about_basma.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

class MyPostsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: Consumer<PostProvider>(builder: (context, postProvider, child) {
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
                  state: post.state,
                );
              },
              itemCount: postProvider.posts.length,
            ),
          );
        }),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String username;
  final String postImage;
  final String postText;
  final String category;
  final int likeCount;
  final id;
  final state;

  PostCard(
      {required this.username,
      required this.category,
      required this.postImage,
      required this.postText,
      required this.likeCount,
      required this.id,
      required this.state});

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
                trailing: Text(
                  state,
                  style: TextStyle(
                      color: state == "pending"
                          ? Colors.blue
                          : (state == "approved" ? Colors.green : Colors.red)),
                ),
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
                    IconButton(
                        onPressed: () {
                          showDialog(context: context, builder: (_)=>AlertDialog(
                            content: Container(
                              padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text("select category"),
                                SizedBox(width: 10,),
                                Row(
                                  children: [
                                    TextButton(onPressed: (){
                                      postProvider.updatePost(id,'activity', context);
                                    }, child: Text('Activity')),
                                    SizedBox(width: 10,),
                                    TextButton(onPressed: (){
                                      postProvider.updatePost(id,'story', context);
                                    }, child: Text("Story"))
                                  ],
                                )
                              ],
                            ),
                            ),
                          ),);


                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.blue,
                        )),
                    IconButton(
                        onPressed: () {
                          postProvider.deletePost(id, context);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
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
