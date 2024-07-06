import 'package:basma/models/subject.dart';
import 'package:basma/provider/edu_provider.dart';
import 'package:basma/screens/graduation/edu/tiltle_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subject'),
      ),
      body: Consumer<EduProvider>(
        builder: (_,eduProvider,k){
          return Container(
            padding: EdgeInsets.all(10),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (_, i) {
                  Subject subject= eduProvider.subject[i];
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ChangeNotifierProvider(
                              create: (_) =>
                              EduProvider()..getAllTitle(subject.id),
                              child: TitleScreen(),
                            ),
                          ));
                    },
                    child: Container(

                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                          color: Colors.white
                      ),
                      child:Center(child: Text(subject.name),),
                    ),
                  );
                }),
          );
        },

      ),
    );
  }
}
