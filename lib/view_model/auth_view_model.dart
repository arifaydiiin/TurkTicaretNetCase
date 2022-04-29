import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:turkticaretcase/model/usermodel.dart';
import 'package:turkticaretcase/service/firebase/firebaseAuth.dart';

class AuthViewModel with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
   User? _firebaseuser;
   UserModel? _usermodel;
  UserModel? get user => _usermodel;

  UserModel? userfromfirebase(User? user) {
    if (user == null) return null;
    return UserModel(username: user.uid, email: user.email!);
  }

  AuthViewModel() {
    currentuser();
    notifyListeners();
  }

   currentuser() {
    try {
      _firebaseuser = _auth.currentUser;
      _usermodel = userfromfirebase(_firebaseuser);
      print("user durumu: "+_usermodel.toString());
    } catch (e) {
      print("hata");
    }

    notifyListeners();
  }

  Future<UserModel?> loginEmailandPassword(
      String email, String password) async {
    try {
      var _firebaseuser =
          await FirebaseAuthService().loginEmailandPassword(email, password);
      _usermodel = userfromfirebase(_firebaseuser);
      notifyListeners();
      return _usermodel;
    } catch (e) {
      return null;
    }
  }

   Future<UserModel?> signInWithGoogle() async {
    try {
      var _firebaseuser =
          await FirebaseAuthService().signInWithGoogle();
      _usermodel = userfromfirebase(_firebaseuser);
      notifyListeners();
      return _usermodel;
    } catch (e) {
      return null;
    }
  }



  Future<bool> logout() async {
    try {
      var response = await FirebaseAuthService().logout();
      _usermodel=null;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
