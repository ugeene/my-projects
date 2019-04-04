import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mapper/util/firebase_listenter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseGoogleUtil {
  static final FirebaseGoogleUtil _instance = new FirebaseGoogleUtil.internal();
  //final GoogleSignIn _googleSignIn = new GoogleSignIn();

	GoogleSignIn _googleSignIn = GoogleSignIn(
	  scopes: [
	    'email',
	    'https://www.googleapis.com/auth/contacts.readonly',
	  ],
	);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuthListener _view;

  FirebaseGoogleUtil.internal();

  factory FirebaseGoogleUtil() {
    return _instance;
  }

  setScreenListener(FirebaseAuthListener view) {
    _view = view;
  }

  Future<FirebaseUser> signInWithGoogle() async {
	  try {
	    await _googleSignIn.signIn();
	  } catch (error) {
	    print(error);
	  }

  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final FirebaseUser user = await _auth.signInWithCredential(credential);
  print("signed in " + user.displayName);
  return user;

}

  void onLoginUserVerified(FirebaseUser currentUser) {
    _view.onLoginUserVerified(currentUser);
  }

  onTokenError(String string) {
    _view.onError(string);
  }
}

//imported a new code and changed the signInWithGoogle future function