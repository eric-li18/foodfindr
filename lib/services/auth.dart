import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodfindr/models/user.dart';

//CONSIDER MAKING THIS AUTH SERVICE A SINGLETON?
class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  //LISTEN FOR AUTH CHANGES
  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //SIGN IN AS ANON
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //SIGN IN WITH EMAIL AND PASSWORD

  //REGISTER WITH EMAIL & PASSWORD

  //SIGN OUT
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}