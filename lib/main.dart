import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mla/constants/firebase_credentials.dart';
import 'package:mla/screens/login_screen.dart';
import 'package:mla/screens/mla_view_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await /*kIsWeb == true? Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: apiKey,
        appId: appId,
        messagingSenderId: messagingSenderId,
        projectId: projectId,
        authDomain:authDomain,
        storageBucket: storageBucket,
      )
  ):*/
      Firebase.initializeApp(
          options: kIsWeb == true
              ? FirebaseOptions(
                  apiKey: apiKey,
                  appId: appId,
                  messagingSenderId: messagingSenderId,
                  projectId: projectId,
                  authDomain: authDomain,
                  storageBucket: storageBucket)
              : null);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MLA's",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        fontFamily: 'Poppins', // Default font family
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
