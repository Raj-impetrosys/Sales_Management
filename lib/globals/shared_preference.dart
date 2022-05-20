import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  // static saveUserDetail({String? userId, bool isLogin = false}) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString('userId', userId!);
  //   prefs.setBool('isLogin', isLogin);
  // }

  static saveUser({User? user}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', user!.uid);
    prefs.setBool('isLogin', true);
    prefs.setString('displayName', user.displayName!);
    prefs.setString('email', user.email!);
    prefs.setString('phoneNumber', user.phoneNumber!);
    prefs.setString('photoURL', user.photoURL!);
    prefs.setBool('emailVerified', user.emailVerified);
    prefs.setBool('isAnonymous', user.isAnonymous);
    prefs.setString('lastSignInTime', user.metadata.lastSignInTime.toString());
  }

  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId')!;
  }

  static Future<bool> getIsLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLogin') ?? false;
  }

  static Future<String> getDisplayName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('displayName')!;
  }

  static Future<String> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('email')!;
  }

  static Future<String> getPhoneNumber() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('phoneNumber')!;
  }

  static Future<String> getphotoURL() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('photoURL')!;
  }
}
