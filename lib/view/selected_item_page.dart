import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkticaretcase/model/cartmodel.dart';
import 'package:turkticaretcase/model/menumodel.dart';

class SelectedItemPage extends StatefulWidget {
  MenuModel item;
  SelectedItemPage({Key? key, required this.item}) : super(key: key);

  @override
  State<SelectedItemPage> createState() => _SelectedItemPageState();
}

class _SelectedItemPageState extends State<SelectedItemPage> {
  @override
  Widget build(BuildContext context) {
    var cardprovider = Provider.of<CardModel>(context);
    var data = widget.item;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFFD11770), Color(0xFF644AB5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        width: width,
        height: height,
        child: Column(
          children: [
            SizedBox(
              height: 110,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                RotationTransition(
                  turns: AlwaysStoppedAnimation(35 / 360),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Colors.white.withOpacity(0.14),
                         boxShadow: [
      BoxShadow(
        color: Colors.white.withOpacity(0.14),
        spreadRadius: 5,
        blurRadius: 14,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
                      ),
                      width: 180,
                      height: 180,
                      
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  height: 200,
                  child: Image.network(
                    data.itemurl,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Flexible(
              flex: 1,
              child: Container(
                width: width,
                height: height * 0.70,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(60)),
                    color: Colors.white),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: height * 0.0690,
                          width: width * 0.242,
                          decoration: BoxDecoration(
                              color: Color(0xFFCC1A74),
                              borderRadius: BorderRadius.circular(22)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset("lib/assets/star.png"),
                              Text(
                                data.itempoint.toString(),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: "Poppins-SemiBold"),
                              ) //fontfamily eklenicek..
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Text(
                          "\$${data.itemprice}",
                          style:
                              TextStyle(fontSize: 23, color: Color(0xFFB4AC03)),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          data.itemname,
                          style: TextStyle(
                              fontFamily: "Poppins-SemiBold", fontSize: 21),
                        ),
                        SizedBox(),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                    "lib/assets/circularnegative.png")),
                            Text("1"),
                            IconButton(
                                onPressed: () {},
                                icon:
                                    Image.asset("lib/assets/circularplus.png")),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 36),
                      child: Text(
                        data.itemdescribe,
                        style:
                            TextStyle(color: Color(0xFF787878), fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 36.0),
                          child: Text(
                            "Adds Ons",
                            style: TextStyle(
                                fontSize: 18, fontFamily: "Poppins-Regular"),
                          ),
                        )),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _adds_ons_items("lib/assets/food1.png"),
                        _adds_ons_items("lib/assets/food2.png"),
                        _adds_ons_items("lib/assets/food3.png"),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("eklendi");
                        cardprovider.add(data);
                        
                      },
                      child: Container(
                        width: 329,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: Color(0xFFCC1A74)),
                        child: Center(
                            child: Text(
                          "Add to Card",
                          style: TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                              fontFamily: "Poppins-SemiBold"),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack _adds_ons_items(String foodtype) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 81,
          height: 80,
          decoration: BoxDecoration(
              color: Color(0xFFD9C9C9),
              borderRadius: BorderRadius.circular(22)),
          child: Image.asset(foodtype),
        ),
        Positioned(
            right: 0,
            bottom: 0,
            child: Container(
                transform: Matrix4.translationValues(12, 5, 0.0),
                child: Image.asset("lib/assets/greencircular.png")))
      ],
    );
  }
}
