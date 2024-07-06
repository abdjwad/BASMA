import 'package:basma/provider/PostProvider%20.dart';
import 'package:basma/screens/homePage/componants/PostScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'HeadHome.dart';

class body extends StatelessWidget {
  const body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        Consumer<PostProvider>(builder: (context, postProvider, child) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    HeadHome(),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),

                      height: 80,child: ListView.builder(
                     scrollDirection: Axis.horizontal, itemBuilder:
                    (_,i){
                      return InkWell(
                        onTap: (){
                          postProvider.filter(i);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                              ,border:Border.all(color:Colors.black)
                          ),
                          child: Text(postProvider.category[i]),
                        ),
                      );
                    }
                      ,itemCount:postProvider.category.length ,),),
                    SizedBox(height: 10,),
                    Expanded(child: PostScreen()),
                  ],
                ),
              ),
            );
          }
          ),
        ],
      ),

    );
  }
}
