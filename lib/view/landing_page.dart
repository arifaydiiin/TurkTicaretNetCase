import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkticaretcase/view/home_page.dart';
import 'package:turkticaretcase/view/login.dart';
import 'package:turkticaretcase/view/navbar.dart';
import 'package:turkticaretcase/view_model/auth_view_model.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     var loginprovider =Provider.of<AuthViewModel>(context);
    return loginprovider.user!=null ? NavBar() : Login();
 
  }
}