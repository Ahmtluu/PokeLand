import 'package:flutter/material.dart';
import 'Pages/splash_screen.dart';

void main() => runApp(
      MaterialApp(
        //ThemeData uygulamamızda kullandığımız renklerin, temaların veya
        // fontların saklandığı bölümdür.
        //Eğer karanlık tema kullanmak isterseniz ThemeData.dark() şeklinde
        // değiştirebilirsiniz.
        theme: ThemeData(accentColor: Colors.teal),
        title: "PokeLand",
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
