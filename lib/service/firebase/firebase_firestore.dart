import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:turkticaretcase/model/cartmodel.dart';
import 'package:turkticaretcase/model/menumodel.dart';
import 'package:uuid/uuid.dart';

class FirebaseFireStoreServis {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<MenuModel>> fetchMenu() async {
    List<MenuModel> items = [];
    var menuler = await _firestore.collection("menuler").get();
    for (var veriler in menuler.docs) {
      MenuModel item = MenuModel.fromMap(veriler.data());
      print(item.itemname);
      items.add(item);
    }
    return items;
  }

  Future sendData(List<MenuModel> json) async {
    try {
      var uuid = Uuid();
      var id = uuid.v1();
      for (MenuModel model in json) {
        await FirebaseFirestore.instance
            .collection('basket')
            .doc(id)
            .set(model.toMap());
      }
    } catch (e) {
      print(e);
    }
  }
}
