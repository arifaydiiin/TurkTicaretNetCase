import 'package:flutter/material.dart';
import 'package:turkticaretcase/model/menumodel.dart';
import 'package:turkticaretcase/view/home_page.dart';
import 'package:turkticaretcase/view/landing_page.dart';
import 'package:turkticaretcase/view/login.dart';
import 'package:turkticaretcase/view/navbar.dart';
import 'package:turkticaretcase/view/selected_item_page.dart';
import 'package:turkticaretcase/view/splashscreen.dart';



class RouterGenerate {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name)
    {
      case '/':
      return  MaterialPageRoute(builder: (_)=>SplashScreen());
      case '/login':
      return MaterialPageRoute(builder: (_)=>Login());
      case '/navbar':
      return MaterialPageRoute(builder: (_)=>NavBar());
      case '/home':
      return MaterialPageRoute(builder: (_)=>Home());
      case '/selecteditems':
      var data = settings.arguments as MenuModel;
      return MaterialPageRoute(builder: (_)=>SelectedItemPage(item: data,));
      case '/landingpage':
      return MaterialPageRoute(builder: (_)=>LandingPage());

      default:
      return MaterialPageRoute(builder: (_)=>Scaffold(body: Center(child: Text("Error"),),));
    }
  }
}