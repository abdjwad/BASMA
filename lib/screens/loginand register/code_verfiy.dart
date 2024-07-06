import 'package:basma/widget/customTextFild.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/authProvider.dart';

class CodeVerfiy extends StatelessWidget {
  const CodeVerfiy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
    return    Container(
          child: Center(
            child: Column(
              children: [
                Container(
                  child: customTextFormFiled(
                    icon: 'assets/icons/Lock.svg',
                    keyboardType: TextInputType.number,
                    controller: authProvider.code,
                    title: 'Email',
                    hint: ' Enter code',
                    errorMessage: 'Please enter code',
                  ),
                ),
        ElevatedButton(
          onPressed: (){
            authProvider.verfiyCode(context);
            if(authProvider.error!=null){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(authProvider.error.toString())));
            }
          },
          child: Text("Continue"),
        )

              ],
            )
          ),
        );
      },
    ));
  }
}
