import 'package:flutter/material.dart';

class DebitScreen extends StatefulWidget {
  const DebitScreen({Key? key}) : super(key: key);

  @override
  _DebitScreenState createState() => _DebitScreenState();
}

class _DebitScreenState extends State<DebitScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Image.asset(
            "assets/DebateRoom.png",
            fit: BoxFit.cover,
          
          ),
        ),
      ),
    ));
  }
}
