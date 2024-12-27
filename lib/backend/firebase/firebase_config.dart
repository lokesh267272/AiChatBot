import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDwrvrfvbrbNaJGUu6OCqtFMNxbiR8onv0",
            authDomain: "vertex-a-i-gemini-dynam-1zmn51.firebaseapp.com",
            projectId: "vertex-a-i-gemini-dynam-1zmn51",
            storageBucket: "vertex-a-i-gemini-dynam-1zmn51.appspot.com",
            messagingSenderId: "118245057402",
            appId: "1:118245057402:web:c625fd99b39d456ba66cc3"));
  } else {
    await Firebase.initializeApp();
  }
}
