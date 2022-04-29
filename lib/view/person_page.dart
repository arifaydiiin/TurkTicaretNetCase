import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkticaretcase/view_model/auth_view_model.dart';
class PersonPage extends StatefulWidget {
  PersonPage({Key? key}) : super(key: key);

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    var authprovider = Provider.of<AuthViewModel>(context);
    return Center(
      child: ElevatedButton(onPressed: ()async{
       var cevap = await authprovider.logout();
       
      }, child: Text("Quit")),
      
    );
  }
}