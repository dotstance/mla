import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:mla/screens/congress/congress_homepage.dart';
import 'package:mla/screens/mla_home_screen.dart';
import 'package:mla/screens/ysrcp/ysrcp_homepage.dart';

import 'bjp/bjp_homepage.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 75.0,
          items: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/brs_icon.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/YSRCPlogo.png",
                scale: 12,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/congress_icon.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/bjp_Icon.png"),
            ),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.black12.withOpacity(0.05),
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
              print("_page :$_page");
              switch (_page) {
                // case 1:
                //   Get.to(YsrCpHomePage());
                //   break;
              }
            });
          },
          letIndexChange: (index) => true,
        ),
        body: Container(
            color: Colors.blueAccent,
            child: _page == 0
                ? MlaHomeScreen(
                    "https://firebasestorage.googleapis.com/v0/b/forefront-ca776.appspot.com/o/kcrwalkinganimation.glb?alt=media&token=15022fa2-6c20-4c40-b820-ba8a23d48fe1")
                : _page == 1
                    ? YsrCpHomePage()
                    : _page == 2
                        ? CongressHomePage()
                        : BJPHomePage()));
  }
}
