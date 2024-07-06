import 'package:flutter/material.dart';

import '../../../components/palette.dart';

class IconBall extends StatelessWidget {
  const IconBall({
    super.key,
    required this.image,
    required this.numnaf,
    required this.press,
  });

  final String image;
  final int numnaf;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.5),
                shape: BoxShape.circle),
            child: Image.asset(image),
          ),
          if(numnaf!=0)
            Positioned(
              right: 0,
              // top: -1,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                    color: Color(0xFFFF4848),
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.5, color: Colors.white)),
                child: Center(
                    child: Text(
                      '$numnaf',
                      style: TextStyle(fontSize: 9, color: Colors.white),
                    )),
              ),
            ),
        ],
      ),
    );
  }
}