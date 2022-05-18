import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class OynaFirebaseUser {
  OynaFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

OynaFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<OynaFirebaseUser> oynaFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<OynaFirebaseUser>((user) => currentUser = OynaFirebaseUser(user));
