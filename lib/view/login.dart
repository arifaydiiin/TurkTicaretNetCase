import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkticaretcase/view_model/auth_view_model.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var loginprovider = Provider.of<AuthViewModel>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFFFF8686), Color(0xFF0A1342)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 22.0, bottom: 8),
                child: Text(
                  "Login to your Account",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22.0),
                child: Container(
                  width: width * 0.87,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87, width: 2),
                      ),
                    ),
                    controller: _emailcontroller,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22.0),
                child: Container(
                  width: width * 0.87,
                  child: TextField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: "Password",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87, width: 2),
                      ),
                    ),
                    controller: _passwordcontroller,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: width,
                height: height / 2,
                decoration: BoxDecoration(
                    color: Color(0xFF8D34A4),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        topRight: Radius.circular(18))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        print("tıklandı");
                        await loginprovider.loginEmailandPassword(
                            _emailcontroller.text, _passwordcontroller.text);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF927583),
                            borderRadius: BorderRadius.circular(18)),
                        width: width * 0.67,
                        height: height * 0.07,
                        child: Center(
                            child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.07,
                    ),
                    Text("-Or Sign in with-"),
                    SizedBox(
                      height: height * 0.07,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 50,
                        ),
                        _iconsbutton(width, height, "googleicon", () async {
                          print("google tık");
                          await loginprovider.signInWithGoogle();
                        }),
                        _iconsbutton(width, height, "facebookicon", () {}),
                        _iconsbutton(width, height, "twittericon", () {}),
                        SizedBox(
                          width: 50,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.07,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don’t have an account?"),
                        TextButton(
                          onPressed: () {
                            //hesap oluşturma işlemleri
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _iconsbutton(
      double width, double height, String path, VoidCallback onpress) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: Colors.white),
      width: width * 0.18,
      height: height * 0.05,
      child: IconButton(
          onPressed:onpress,
          icon: Center(
              child: Image.asset(
            "lib/assets/icons/${path}.png",
            fit: BoxFit.cover,
          ))),
    );
  }
}
