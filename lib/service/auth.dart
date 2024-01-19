import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static var auth = FirebaseAuth.instance;
  static var functions = FirebaseFunctions.instance;

  static Future<UserCredential> signInCustom(String token) async {
    var cred = await auth.signInWithCustomToken(token);
    return cred;
  }

  static Future<UserCredential> login(
    String email,
    String password,
  ) async {
    var cred = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return cred;
  }

  static Future<UserCredential> register(
    String email,
    String password,
    String username,
  ) async {
    var cred = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await cred.user?.updateDisplayName(username);

    return cred;
  }

  static Future<String> getCustomToken(String address) async {
    var http = functions.httpsCallable('customToken');
    var res = await http.call({'address': address});
    return res.data as String;
  }

  static Future<void> resetPassword(String email) {
    return auth.sendPasswordResetEmail(email: email);
  }

  static User? getCurrentUser() {
    return auth.currentUser;
  }
}
