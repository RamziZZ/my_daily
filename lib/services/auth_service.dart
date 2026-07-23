import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // User reactive
  final Rxn<User> _user = Rxn<User>();

  User? get currentUser => _user.value;

  bool get isLoggedIn => _user.value != null;

  FirebaseAuth get auth => _auth;

  @override
  void onInit() {
    super.onInit();

    // Pantau perubahan login/logout
    _auth.authStateChanges().listen((User? user) {
      _user.value = user;
    });
  }


  // =========================
  // REGISTER
  // =========================

  Future<UserCredential> register({
    required String username,
    required String email,
    required String password,
  }) async {

    try {
      final credential =
          await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );


      // Simpan username ke Firebase Auth Profile
      await credential.user?.updateDisplayName(
        username.trim(),
      );


      await credential.user?.reload();


      _user.value = _auth.currentUser;


      return credential;

    } on FirebaseAuthException catch (e) {
      throw Exception(
        e.message ?? "Register gagal",
      );
    }
  }



  // =========================
  // LOGIN
  // =========================

  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {

    try {

      final credential =
          await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );


      _user.value = credential.user;


      return credential;


    } on FirebaseAuthException catch (e) {

      throw Exception(
        e.message ?? "Login gagal",
      );
    }
  }




  // =========================
  // LOGOUT
  // =========================

  Future<void> logout() async {

    await _auth.signOut();

    _user.value = null;
  }




  // =========================
  // RESET PASSWORD
  // =========================

  Future<void> resetPassword(
      String email,
  ) async {

    try {

      await _auth.sendPasswordResetEmail(
        email: email.trim(),
      );


    } on FirebaseAuthException catch (e) {

      throw Exception(
        e.message ?? "Reset password gagal",
      );
    }
  }


}