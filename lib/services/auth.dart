import 'package:firebase_auth/firebase_auth.dart';
import 'package:boolu/model/user.dart';
import 'package:boolu/services/database.dart';
import 'dart:async';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User>get user{
  return _auth.onAuthStateChanged
    .map(_userFromFirebaseUser);

}

  Future signInWithEmail(String email, String password) async {
    try{ 
      AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password
      );
    FirebaseUser user = result.user;
    return _userFromFirebaseUser(user);
    } catch (e){
      print(e.toString());
      return null;
    }
  }

Future registerWithEmail(String email, String password, String fullName) async{

    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      
      UserUpdateInfo updateInfo = UserUpdateInfo();
      updateInfo.displayName = fullName;
      await user.updateProfile(updateInfo);
      await DatabaseService(uid : user.uid).updateUserData(fullName, email);

      return _userFromFirebaseUser(user);
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }
  
 
  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }

    Future resetPassword(String email) async {
    try{
      await _auth.sendPasswordResetEmail(email: email);
        return 'success';

    } catch (e) {
      print(e.toString());
    }
  }

}