import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkticaretcase/model/cartmodel.dart';
import 'package:turkticaretcase/model/menumodel.dart';
import 'package:turkticaretcase/view_model/firestore_view_model.dart';

class BasketPage extends StatefulWidget {
  BasketPage({Key? key}) : super(key: key);

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  void initState() {
    super.initState();
    
  }
  TextEditingController _inscontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var providercard = Provider.of<CardModel>(context);
       var providerstore = Provider.of<FirestoreViewModel>(context);
    return providercard.getcard.length != 0
        ? Scaffold(
            body: SafeArea(
              child: Container(
                width: width,
                height: height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        providercard.getcard.length.toString() +
                            " items in Card",
                        style: TextStyle(
                            fontFamily: "Poppins-SemiBold", fontSize: 26),
                      ),
                    ),
                    Container(
                      height: height * 0.40,
                      child: ListView.builder(
                          itemCount: providercard.getcard.length,
                          itemBuilder: (context, index) {
                            var data = providercard.getcard[index].menuModel;
                            var count = providercard.getcard[index].quantity;
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 9, right: 10),
                                  child: Container(
                                    width: width * 0.26,
                                    height: height * 0.15,
                                    decoration:
                                        BoxDecoration(color: Color(0xFFD9C9C9)),
                                    child: Image.network(data.itemurl),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.itemname,
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontFamily: "Poppins-Medium"),
                                    ),
                                    Text("\$" + data.itemprice.toString(),
                                        style: TextStyle(
                                            fontSize: 23,
                                            fontFamily: "Poppins-SemiBold",
                                            color: Color(0xFFB4AC03))),
                                    Row(
                                      children: [
                                        IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              providercard.decQuantity(data);
                                            },
                                            icon: Image.asset(
                                                "lib/assets/circularnegative.png")),
                                        Text(count.toString()),
                                        IconButton(
                                            onPressed: () {
                                              providercard.incQuantity(data);
                                            },
                                            icon: Image.asset(
                                                "lib/assets/circularplus.png")),
                                        SizedBox(
                                          width: 105,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      providercard.clearone(index);
                                    },
                                    icon: Image.asset("lib/assets/Cancel.png"))
                              ],
                            );
                          }),
                    ),
                    //..
                    Padding(
                      padding: const EdgeInsets.only(left:30,bottom: 5),
                      child: Text(
                        "Order Instructions",
                        style: TextStyle(
                            fontFamily: "Poppins-Regular", fontSize: 23),
                      ),
                    ),

                    Center(
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(width: 1,color: Colors.black)
                          ),
                          width: width * 0.85,
                          height: height * 0.09,
                          child: TextField(
                            decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                            ),
                            controller: _inscontroller,
                          )),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:30.0,right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("TOTAL:",style: TextStyle(fontSize: 23,fontFamily: "Poppins-Medium"),),
                          Text("\$"+providercard.totalprice.toString(),style: TextStyle(fontSize: 26,fontFamily: "Poppins-SemiBold",color:Color(0xFFB4AC03)))
                        ],
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: (){

                          List<MenuModel> items=[];
                          providercard.getcard.forEach((element) {
                            items.add(element.menuModel);
                          });
                           providerstore.sendData(items);
                        },
                        child: Container(
                          child: Center(child: Text("Check Out",style: TextStyle(fontFamily: "Poppins-SemiBold",color: Colors.white,fontSize: 26),)),
                          width: width*0.80,
                          height: height*0.08,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: Color(0xFFCC1A74),
                          ),
                        ),
                      ),
                    ),
                    TextButton(onPressed: (){
                        print(providercard.getcard[0].menuModel.itemname);

                    }, child: Center(child: Text("Back to Menu",style: TextStyle(fontSize: 20,fontFamily: "Poppins-SemiBold",color: Colors.black),)))
                  ],
                ),
              ),
            ),
          )
        : Scaffold(body: Center(child: Text("No Product on basket")));
  }
}

//  Text(providercard.getcard.length.toString()+"items in Card"
//               ),
//               ElevatedButton(onPressed: (){
//              providercard.incQuantity(providercard.getcard[index]);
//               }, child: Text("arttır."))