import 'package:basma/provider/PostProvider%20.dart';
import 'package:basma/provider/edu_provider.dart';
import 'package:basma/screens/graduation/edu/home_edu.dart';
import 'package:basma/screens/graduation/edu/my_explanation.dart';
import 'package:basma/screens/homePage/componants/my_posts.dart';
import 'package:basma/screens/store/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../graduation/graduation.dart';
import 'componants/body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeBageState();
}

class _HomeBageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        backgroundColor: Color(0xFF98c242).withOpacity(0.1),
        color: Color(0XFFb271a7),
        tabs: [
          GButton(
            icon: Icons.grading_rounded,
            text: 'graduation',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                    create: (_) => EduProvider()..getAllClassRoom(),
                    child: HomeEdu(),
                  ),
                ),
              );
            },
          ),
          GButton(
            icon: Icons.home,
            text: 'home',
          ),
          GButton(
            icon: Icons.store,
            text: 'stor',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductGridScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: body(),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                },
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(Icons.library_books),
                title: Text('My Post'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ChangeNotifierProvider(
                                create: (_) => PostProvider()..getMyPosts(),
                                child: MyPostsScreen(),
                              )));
                },
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: SvgPicture.asset("assets/icons/Question mark.svg"),
                title: Text('My Explanation'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ChangeNotifierProvider(
                                create: (_) => EduProvider()
                                  ..getPindingExplanationsforOder(),
                                child: MyExplanation(),
                              )));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
