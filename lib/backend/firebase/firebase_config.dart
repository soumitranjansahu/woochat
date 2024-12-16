import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAoUx7XETyVP7oDNR6Xd5rrWoIDoKRe1hc",
            authDomain: "woochat-itgqwy.firebaseapp.com",
            projectId: "woochat-itgqwy",
            storageBucket: "woochat-itgqwy.appspot.com",
            messagingSenderId: "115831598819",
            appId: "1:115831598819:web:5e5eac3a1e9a066dc99fd6"));
  } else {
    await Firebase.initializeApp();
  }
}
