import 'package:basma/components/palette.dart';
import 'package:basma/forgot_password/forgot_password_screen.dart';
import 'package:basma/provider/PostProvider%20.dart';
import 'package:basma/widget/customTextFild.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/custom_surfix_icon.dart';
import '../../models/sign_up_form.dart';
import '../../provider/authProvider.dart';
import '../homePage/HomePage.dart';

class LoginRegisterPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:70.0,left: 20,right: 20),
        child: Consumer<AuthProvider>(
          builder: (context, authProvider, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    authProvider.isLogin ? 'Login' : 'Register',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold,color: Palette.textColor1),
                  ),
                  SizedBox(height: 20,),
                  Image(image: AssetImage("assets/images/photo_2_2024-06-01_13-09-41.jpg",),fit: BoxFit.cover,height: 150,width: 150,),


                  SizedBox(height: 20),
                  if (!authProvider.isLogin) ...[
                    SizedBox(height: 10),
                    customTextFormFiled(
                      icon: 'assets/icons/User.svg',
                      keyboardType: TextInputType.text,


                      controller: authProvider.name,
                      title: 'name',
                      hint: ' name',
                      errorMessage: 'Please enter name',
                    ),
                  ],
                  SizedBox(height: 10),
                  customTextFormFiled(
                    icon: 'assets/icons/Mail.svg',


                    keyboardType: TextInputType.emailAddress,

                    controller: authProvider.email,
                    title: 'Email',
                    hint: ' Enter email',
                    errorMessage: 'Please enter Email',
                  ),
                  SizedBox(height: 10),
                  customTextFormFiled(
                    icon: 'assets/icons/Lock.svg',

                    keyboardType: TextInputType.phone,
                    controller: authProvider.password,
                    title: 'Password',
                    hint: ' Enter Password',
                    errorMessage: 'Please enter Password',
                  ),

                  SizedBox(height: 20),
                  if (authProvider.isLogin) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));},
                        child: Text(
                          'Forget password?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Palette.textColor1,
                          ),
                        ),
                      ),
                    ],
                  ),],
                  SizedBox(height: 90,),
                  ElevatedButton(
                    style: ButtonStyle(

                    ),
                    onPressed: () {
                      if (authProvider.isLogin) {
                        authProvider.login();
                        if(authProvider.user==null){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(authProvider.error.toString())));
                        }else{
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangeNotifierProvider(create: (_)=>PostProvider()..getAllPosts()
                          ,child:HomePage(),
                          )

                          )
                          );
                        }

                      } else {
                        authProvider.register(context);

                      }
                    },
                    child: Text(authProvider.isLogin ? 'Login' : 'Register'),
                  ),
                  TextButton(
                    onPressed: () {
                      authProvider.toggleLoginRegister();
                    },
                    child: Text(authProvider.isLogin
                        ? 'Don\'t have an account? Register'
                        : 'Already have an account? Login'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
