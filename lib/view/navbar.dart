import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turkticaretcase/model/cartmodel.dart';
import 'package:turkticaretcase/view/basket_page.dart';
import 'package:turkticaretcase/view/home_page.dart';
import 'package:turkticaretcase/view/person_page.dart';
import 'package:turkticaretcase/view/search_page.dart';
class NavBar extends StatefulWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List <Widget> pages=[
    Home(),
    SearchPage(),
    BasketPage(),
    PersonPage(),
  ];
   int currentindex=0;
  @override
  Widget build(BuildContext context) {
    var basketprovider = Provider.of<CardModel>(context);
    return Scaffold(
       bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            currentindex=index;
          });
          
        },
        currentIndex: currentindex,
          showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Color(0xFFCE1973),
        unselectedItemColor: Colors.grey,
        
    items:  <BottomNavigationBarItem>[
      BottomNavigationBarItem(
         
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Stack(
          children: [
            Icon(Icons.shopping_cart),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color:  currentindex==2 ?Color(0xFFD21670): null,
                  borderRadius: BorderRadius.circular(50)
                ),
                transform: Matrix4.translationValues(5, -11, 0.0),
                child: Center(child: Text(basketprovider.getcard.length==null ? "" :basketprovider.getcard.length.toString(),style: TextStyle(color: Colors.white,fontSize: 11),))))
          ],
        ),
        label: 'Basket',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Person',
      ),
    ],
  ),
  body: pages[currentindex],
    );
  }
}