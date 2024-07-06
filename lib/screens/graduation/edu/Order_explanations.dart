import 'package:basma/models/OrderExp.dart';
import 'package:basma/provider/edu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderExplanations extends StatelessWidget {
  const OrderExplanations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

          appBar: AppBar(
            title: Text('OrderExplanations'),
          ),
          body: Consumer<EduProvider>(
            builder: (_,eduProvider,k){
              return Container(
                padding: EdgeInsets.all(10),
                child: ListView.builder(

                    itemBuilder: (_, i) {
                      OrderExp t= eduProvider.orderExp[i];
                      InkWell(
                        onTap: (){

                        },
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                              color: Colors.white
                          ),
                          child:ListTile(
                            title: Text(t.note),
                            leading: Text("Explanations :"+ t.approvals),
                            trailing: IconButton(icon: Icon(Icons.add,),onPressed: (){
                              eduProvider.createExplanationsforOder(t.id);
                            },),
                          ),),

                      );
                    }),
              );
            },

          ),

    );
  }
}
