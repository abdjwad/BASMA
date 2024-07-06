import 'package:basma/models/explanation.dart';
import 'package:basma/provider/edu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExplanationsByTitle extends StatelessWidget {
  const ExplanationsByTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Consumer<EduProvider>(
        builder: (_,eduProvider,k){
          return Container(
            padding: EdgeInsets.all(10),
            child: ListView.builder(

                itemBuilder: (_, i) {
             Explanation explanation=eduProvider.ExpBytitle[i];
                  return InkWell(
                    onTap: (){},
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                          color: Colors.white
                      ),
                      child:Column(
                        children: [
                          Text(explanation.title),
                          SizedBox(height: 10,),
                          Container(height: 70,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                                color: Colors.white
                                ,image: DecorationImage(image: AssetImage('assets/images/splash_1.png'))
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          );
        },

      ),
    );
  }
}
