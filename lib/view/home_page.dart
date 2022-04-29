import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkticaretcase/model/menumodel.dart';
import 'package:turkticaretcase/service/firebase/firebase_firestore.dart';
import 'package:turkticaretcase/view_model/firestore_view_model.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    
  }
  TextEditingController _searchcontroller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    
    var providerstore = Provider.of<FirestoreViewModel>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xFFFFFF),
          width: width,
          height: height,
          child: Column(
            children: [
              _tabbar(),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 12),
                    child: Text(
                      "What do you want to order today ?",
                      style: TextStyle(fontSize: 10),
                    ),
                  )),
              SizedBox(
                height: height * 0.02,
              ),
              _searchbox(width, height),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  _menuitems("all", Color(0xFFD21670), "All"),
                  _menuitems("burger", Color(0xFFD9C9C9), "Burger"),
                  _menuitems("pizza", Color(0xFFD9C9C9), "Pizza"),
                  _menuitems("cheesepizza", Color(0xFFD9C9C9), "Desert"),
                  SizedBox(
                    width: 15,
                  )
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 14.0),
                    child: Text(
                      "Promotions",
                      style: TextStyle(
                          fontSize: 22, fontFamily: "Poppins-SemiBold"),
                    ),
                  )),
              _promotionbox(width, height),

              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 14.0),
                    child: Text(
                      "Most Populer",
                      style: TextStyle(
                          fontSize: 23, fontFamily: "Poppins-Semibold"),
                    ),
                  )),
              Expanded(
                child: FutureBuilder<List<MenuModel>?>(
                  future:providerstore.fetchmenu() ,
                  builder: ((context, snapshot) {
                    if(!snapshot.hasData)
                    {
                      return CircularProgressIndicator();
                    }
                    else if(snapshot.hasError)
                    {
                      return Center(
                        child: Text("Hata var"),
                      );
                    }
                    else{
                         return ListView.builder(
                           scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data![index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 30,
                            ),                     
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    "/selecteditems",arguments: data
                                  );
                                },
                                child: _bottomboxmenu(width, height,
                                    data.itemurl, data.itemname, data.itemprice.toDouble())),
                                    SizedBox(width: 15,),
                          ],
                        );
                      });
                    }
                 
                })),
              ),
            
            ],
          ),
        ),
      ),
    );
  }

  Container _bottomboxmenu(double width, double height, String pathimage,
      String title, double price) {
    return Container(
      width: width * 0.35,
      height: height * 0.20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient:
              LinearGradient(colors: [Color(0xFFD9C9C9), Color(0xFFD5D3D3)])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 9,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child:
                Container(width: 75, height: 75, child: Image.network(pathimage)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(title),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Text("\$$price"),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.control_point_sharp))
            ],
          )
        ],
      ),
    );
  }

  Row _tabbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              CircleAvatar(
                foregroundImage: NetworkImage("https://picsum.photos/200"),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "HI, Kayla",
                style: TextStyle(fontSize: 18, fontFamily: "Poppins-Medium"),
              ),
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none))
      ],
    );
  }

  Container _searchbox(double width, double height) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Color(0xFFD9C9C9),
        ),
        width: width * 0.75,
        height: height * 0.07,
        child: Row(
          children: [
            SizedBox(
              width: 8,
            ),
            Icon(Icons.search),
            Expanded(
                child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "Search"),
              controller: _searchcontroller,
            ))
          ],
        ));
  }

  Container _promotionbox(double width, double height) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
            colors: [Color(0xFFD21670), Color(0xFF3E1F9F)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      width: width * 0.90,
      height: height * 0.19,
      child: Stack(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Today's Offer",
                    style: TextStyle(
                        color: Color(0xFFD4D4D4),
                        fontFamily: "Poppins-Regular",
                        fontSize: 17),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Free Box of Fries",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    "On all others above \$200",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                SizedBox(),
              ],
            ),
          ),
          Positioned(
              right: 0,
              top: 0,
              child: Container(
                  transform: Matrix4.translationValues(10, -50, 0.0),
                  child: Image.asset(
                    "lib/assets/promotion.png",
                    fit: BoxFit.contain,
                  )))
        ],
      ),
    );
  }

  Column _menuitems(String path, Color color, String name) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 81,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18), color: color),
          child: Center(child: Image.asset("lib/assets/$path.png")),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          name,
          style: TextStyle(color: Color(0xFF969696)),
        ),
      ],
    );
  }
}


//  new Container(
//     padding: EdgeInsets.all(0.0),
//     child: Row(
//       mainAxisSize: MainAxisSize.max,
//       children: <Widget>[

//         Expanded(
//           flex: 1,
//           child: IconButton(onPressed: (){}, icon: Icon(Icons.home,))
//         ),
//         Expanded(
//           flex: 1,
//           child: IconButton(onPressed: (){}, icon: Icon(Icons.search))
//         ),
//         Expanded(
//           flex: 1,
//           child: IconButton(onPressed: (){}, icon: Icon(Icons.shopping_basket_outlined))
//         ),
//         Expanded(
//           flex: 1,
//           child: IconButton(onPressed: (){}, icon: Icon(Icons.person))
//         ),
//       ],
//     ),
//   ),