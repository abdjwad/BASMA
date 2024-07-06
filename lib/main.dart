import 'package:basma/provider/PostProvider .dart';
import 'package:basma/provider/authProvider.dart';
import 'package:basma/provider/edu_provider.dart';
import 'package:basma/provider/order_provider.dart';
import 'package:basma/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OrderProvider()),
        ChangeNotifierProvider(create: (context) => PostProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => EduProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => AuthProvider(),

        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme:  const TextTheme(
              //this Font we will use later 'H1'

              displayLarge: TextStyle(

                fontFamily: 'Inter',
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),

              //this font we will use later 'H2'

              displayMedium: TextStyle(

                fontFamily: 'Inter',
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
              //this font we will use  later 'H3'

              displaySmall: TextStyle(
                fontFamily: 'Inter',
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),

              //this font we will use later 'P1'

              bodyLarge: TextStyle(

                fontFamily: 'Inter',
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),

              //this font we will use later 'P2'

              bodyMedium: TextStyle(
                fontFamily: 'Inter',
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              //this font we will use later 'S'
              titleMedium: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              //thus we have added all the fonts used in the projct ..
            ),
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
        ));
  }
}
