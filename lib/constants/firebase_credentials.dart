
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

String apiKey= "AIzaSyAt0vs1ASi_HEAvfVBaJd43xaWRCvpErEI";
String appId= "1:265862988005:web:cdfd96af875407b0d4940c";
String messagingSenderId= "265862988005";
String projectId= "forefront-ca776";
String authDomain="forefront-ca776.firebaseapp.com";
String storageBucket= "forefront-ca776.appspot.com";


final Future<FirebaseApp> initialization = Firebase.initializeApp();
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
// FirebaseAuth auth = FirebaseAuth.instance;