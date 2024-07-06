import 'package:basma/models/explanation.dart';
import 'package:basma/provider/edu_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MyExplanation extends StatelessWidget {
  const MyExplanation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My explanation"),
      ),
      body: Consumer<EduProvider>(builder: (_, eduProvider, k) {
        return Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: () {eduProvider.getPindingExplanationsforOder();},
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54)),
                        child: Center(
                          child: Text("Pinding "),
                        ),
                      ),
                    )),
                    SizedBox(width: 10),
                    Expanded(
                        child: InkWell(
                      onTap: () {eduProvider.getAprovedExplanationsforOder();},
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54)),
                        child: Center(
                          child: Text("Aproved "),
                        ),
                      ),
                    )),
                    SizedBox(width: 10),
                    Expanded(
                        child: InkWell(
                            onTap: () {eduProvider.getUploadedExplanationsforOder();},
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black54)),
                              child: Center(
                                child: Text("Uploaded "),
                              ),
                            )))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(itemBuilder: (_, i) {
                    Explanation explanation = eduProvider.MyExp[i];
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(explanation.title),
                                explanation.state=="approved"?IconButton(onPressed: (){
                                  //upolad Video
                                }, icon: Icon(Icons.file_upload_outlined)):Container()
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/splash_1.png'))),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                )),
              ],
            ));
      }),
    );
  }
}
