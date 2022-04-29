import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:turkticaretcase/model/usermodel.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  late UserModel _usermodel;
  UserModel get user => _usermodel;

  Future<User?> loginEmailandPassword(String email, String password) async {
    try {
      var kimlik = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return kimlik.user!;
    } catch (e) {
      print("Hata :" + e.toString());
      return null;
    }
  }

  
     Future<User?> signInWithGoogle() async {
       try{    
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        var kimlik = await FirebaseAuth.instance.signInWithCredential(credential);
        return kimlik.user!;
        }
        catch(e){
        return null;
        }
      }
  

  Future<bool> logout() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}
