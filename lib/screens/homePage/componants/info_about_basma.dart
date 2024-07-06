import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            Text("About Basma"),
            SizedBox(height: 20,),
            ListTile(leading:Icon(Icons.phone) ,title: Text("0994110000"),),
            ListTile(leading:Icon(Icons.phone) ,title: Text("0116619429"),),
            SizedBox(height: 10,),
            ListTile(leading:Icon(Icons.message) ,title: Text("1077  Syriatel"),),
            ListTile(leading:Icon(Icons.message) ,title: Text("1299  MTN"),),
            SizedBox(height: 10,),
            ListTile(leading: Text("Bank albarka"),title:  Text("7020210"),),
            SizedBox(height: 10,),
            ListTile(leading: Text("Bank Bemo"),title:  Text("0999991"),),
            SizedBox(height: 10,),
            ListTile(leading: Text("Bank syria"),title:  Text("200071"),),
            ListTile(leading:SvgPicture.asset('assets/icons/twitter.svg'),title:  Text("www.twitter.com/basmaGov"),),

          ],
        ),
        ),
    );
  }
}
