import 'package:flutter/material.dart';
import 'package:web_browser/web_browser.dart';

class Mla3DView extends StatefulWidget {
  const Mla3DView({Key? key}) : super(key: key);

  @override
  _Mla3DViewState createState() => _Mla3DViewState();
}

class _Mla3DViewState extends State<Mla3DView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      body:  Container(
        width: size.width,
        height: size.height,
        child: Browser(
          initialUriString: 'https://mla3dwebsite.web.app/',
        ),
        color: Colors.grey,
      ),
    );
  }
}
