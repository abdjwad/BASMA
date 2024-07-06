import 'package:basma/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../../notifcation/notifacation.dart';
import '../../DonationPage/DonationPage.dart';
import 'IconBall.dart';
import 'SearchField.dart';

class HeadHome extends StatelessWidget {
  const HeadHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconBall(image: 'assets/images/.png', numnaf: 0, press: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DonationPage()));
          },),
          SearchField(onChanged: (String ) {  },),

          IconBall(image: 'assets/images/bell-.png', numnaf: 3, press: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NotificationsPage()));
          },),

        ],
      ),
    );

  }
}
