import 'package:basma/models/title.dart';
import 'package:basma/provider/edu_provider.dart';
import 'package:basma/screens/graduation/edu/ExplanationsByTitle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({Key? key}) : super(key: key);

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
                  title t= eduProvider.title[i];
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ChangeNotifierProvider(
                              create: (_) =>
                              EduProvider()..getExplanationsByTitle(t.id),
                              child: ExplanationsByTitle(),
                            ),
                          ));

                    },
                    child: Container(
                     height: 80,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                          color: Colors.white
                      ),
                      child:Center(child: Text(t.name),),
                    ),
                  );
                }),
          );
        },

      ),
    );

  }
}
