import 'package:flutter/material.dart';

import '../../../components/defulte_Button.dart';
import '../../../components/palette.dart';
import '../../loginand register/login_register_page.dart';



class SplashContent extends StatefulWidget {
  SplashContent({super.key});

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Association to support children with cancer!\n We can only bring about real change and improve society together as a collective",
      "image": "assets/images/photo_2_2024-06-01_13-09-41.jpg",
    },
    {
      "text": "Our moral code, our values and what we stand for",
      "image": "assets/images/photo_2_2024-06-01_13-09-41.jpg",
    },
    {
      "text": "Many programs that provide the necessary support in many aspects to children with cancer and their families",
      "image": "assets/images/photo_2_2024-06-01_13-09-41.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: splashData.length,
              itemBuilder: (context, index) => splashConte(
                image: splashData[index]["image"]?.trim() ?? "Default Text",
                text: splashData[index]["text"]?.trim() ?? "Default Text",
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  DefulteButton(
                    prass: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  LoginRegisterPage()));
                    },
                    text: 'Continue',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(),
          ),
        ],
      ),
    ));
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class splashConte extends StatelessWidget {
  splashConte({
    super.key,
    required this.image,
    required this.text,
  });

  final String image, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        const Text(
          'BASMA',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Palette.textColor2,
          ),
        ),
        Padding(

          padding: const EdgeInsets.all(15.0),
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        Spacer(
          flex: 2,
        ),
        Image(
          image: AssetImage(
            image,
          ),
          height: 260,
          width: 260,
        ),
      ],
    );
  }
}
