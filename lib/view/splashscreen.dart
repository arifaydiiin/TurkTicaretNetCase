import 'package:flutter/material.dart';
import 'package:turkticaretcase/constant/color.dart';
class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: ApplicationConstant.splashscreenbackground,begin: Alignment.bottomLeft,end: Alignment.topRight)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height*0.14,
            ),
            Stack(
              alignment: Alignment.center,
              children: [            
                Container(
                  width: width,
                  height: height*0.42,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  left: 30,
                  child: Image.asset("lib/assets/purepng1.png",))
              ],
            ),
            SizedBox(
              height: 100,
            ),
             Padding(
               padding: const EdgeInsets.only(left:24.0),
               child: Row(
                 children: [
                   Text("Your everday ",style: TextStyle(fontSize: 26,color: Colors.white,),),
                   Text("meal",style: TextStyle(fontSize: 26,color: Color(0xFF761616)),)
                 ],
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(top:10,left:24.0),
               child: Row(
                 children: [
                   Text("delivered ",style: TextStyle(fontSize: 26,color: Colors.white),),
                   Text("to you",style: TextStyle(fontSize: 26,color: Color(0xFF761616)),)
                 ],
               ),
             ),
             SizedBox(height: 30,),
             Padding(
               padding:  EdgeInsets.only(left:(width/2-(width*0.27))),
               child: GestureDetector(
                 onTap: (){
                   Navigator.pushNamedAndRemoveUntil(context, "/landingpage", (route) => false);
                 },
                 child: Container(
                   width: width*0.54,
                   height: height*0.07,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(22)
                   ),
                   child: Center(child: Text("Get Started",style: TextStyle(fontSize: 26,color:Color(0xFF644AB5),fontFamily: "Poppins-Regular"),)),
                 ),
               ),
             )
             
          ],
        ),
      ) ,
    );
  }
}