import 'package:flutter/cupertino.dart';
import 'package:turkticaretcase/model/menumodel.dart';

class CardModel with ChangeNotifier {
  List<Items> _cart = [];
  List<Items> get getcard => _cart;
   int totalprice=0;

  int totalpricecalculator() {
    totalprice=0;
    if (_cart.isNotEmpty) {
      _cart.forEach((element) {
         totalprice+=element.quantity*element.menuModel.itemprice;
       });
    }
    return totalprice;
  }

  void add(MenuModel menumodel) {
    // for (Items item in _cart) {
    //   if (item.menuModel.itemname == menumodel.itemname) {
    //     item.quantity++;    
    //     print("item quintity on add"+item.quantity.toString()); 
       
    //     notifyListeners();
    //     return;
    //   }
    // }
    _cart.add(Items(menumodel, 1));
  totalprice = totalpricecalculator();
    notifyListeners();
  }

  void incQuantity(MenuModel model) {
    for (Items item in _cart) {
      if (item.menuModel.itemname == model.itemname) {
        item.quantity++;
        totalprice = totalpricecalculator();
        notifyListeners();
        return;
      }
    }
  }

  void decQuantity(MenuModel model) {
    for (Items item in _cart) {
      if (item.menuModel.itemname == model.itemname && item.quantity > 1) {
        item.quantity--;
        totalprice = totalpricecalculator();
        notifyListeners();
        return;
      }
    }
  }

  void clearCart() {
    _cart.clear();
    totalprice = 0;
    notifyListeners();
  }

  void clearone(int index) {
    _cart.removeAt(index);
    totalprice = totalpricecalculator();
    notifyListeners();
  }
}

class Items {
  MenuModel menuModel;
  int quantity;


  Items(this.menuModel, this.quantity);


  
}

