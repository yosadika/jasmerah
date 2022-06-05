import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class JasmerahFirebaseUser {
  JasmerahFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

JasmerahFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<JasmerahFirebaseUser> jasmerahFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<JasmerahFirebaseUser>(
            (user) => currentUser = JasmerahFirebaseUser(user));
