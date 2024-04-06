import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mla/constants/app_controller.dart';
import 'package:mla/screens/mla_view_screen.dart';
import 'package:o3d/o3d.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_browser/web_browser.dart';

import '../controller/mla_controller.dart';
import 'CameraScreen.dart';
import 'main_screen.dart';
import 'mla_home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var lanuageList = [
    "Telugu",
    "Hindi",
    "English",
  ];

  launchURL() async {
    final Uri url = Uri.parse('https://mlaarview.web.app/complete/lecture7_2/');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  var selectedLanguage = 0;

  O3DController o3dController = O3DController();

  @override
  Widget build(BuildContext context) {
    Get.put(MlaController());
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 55,
              child: InkWell(
                onTap: () {
                  // launchURL();
                },
                child: Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        gradient: RadialGradient(
                          colors: [Colors.white, Color(0xffe7e7e7)],
                          // radius: 10.5,
                          center: Alignment.center,
                          stops: [0.001, 1.0],
                        ),
                      ),
                      //child: CameraScreen(),
                      /*child: Browser(
                        initialUriString: 'https://mlaarview.web.app/complete/lecture7_2/',
                      ),*/
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: size.height/9,),
                            Text(
                              "JAI TELANGANA",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30,
                                  color: Color(0xffDC8E46)),
                            ),
                            Text(
                              "2023 Elections",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  color: Color(0xffDC8E46)),
                            ),
                            Image.asset(
                              'assets/login_gif.gif',
                              // Adjust width and height as needed
                              // width: 250,
                              // height: 250,
                              // Optional: Set the fit property to control how the image is displayed
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 35,
              child: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  gradient: RadialGradient(
                    colors: [Colors.white, Color(0xffe7e7e7)],
                    // radius: 10.5,
                    center: Alignment.center,
                    stops: [0.001, 1.0],
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "VOTE",
                        style: TextStyle(
                            color: Color(0xffDC8E46),
                            fontWeight: FontWeight.w700, fontSize: 46),
                      ),
                      Text(
                        "IS YOUR RIGHT",
                        style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 22, color: Color(0xffDC8E46),),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        width: size.width / 1.1,
                        height: size.height / 14,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 2),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person_2_rounded,
                                  size: 28,
                                  color: Colors.black,
                                ),
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                hintText: "Enter your Name"),
                          ),
                        ),
                      ),
                      Container(
                        width: size.width / 1.1,
                        height: size.height / 12,
                        // color: Colors.green.shade800.withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 16),
                          child: ListView.builder(
                              itemCount: lanuageList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedLanguage = index;
                                      print(
                                          "Seleted language : ${lanuageList[index]}");
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 22),
                                    child: Container(
                                        width: 105,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            color: selectedLanguage == index
                                                ? Colors.black
                                                : Colors.transparent,
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.black,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(22.5)),
                                        child: Center(
                                          child: Text("${lanuageList[index]}",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: selectedLanguage == index
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontWeight: FontWeight.w400,
                                              )),
                                        )),
                                  ),
                                );
                              }),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Get.to(MlaViewScreen());
                          mlaController.getAllMlaList();
                          mlaController.getMlaData(
                            "KALVAKUNTLA CHANDRASHEKHAR RAO",
                            "${mlaController.allMlaList[1].manifesto}",
                            mlaController
                                .allMlaList[1].opponentsMLAs!,"https://upload.wikimedia.org/wikipedia/commons/3/3f/Kalvakuntla_Chandrashekar_Rao.png",);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => MainScreen()),
                          // );
                          Get.offAll(MainScreen());
                        },
                        child: Container(
                          width: size.width / 1.1,
                          height: size.height / 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22.5),
                            color: Color(0xffDC8E46),),
                          child: Center(
                            child: Text("Submit",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
