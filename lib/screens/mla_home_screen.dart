import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mla/MlasYoutubeVideo.dart';
import 'package:mla/constants/app_controller.dart';
import 'package:mla/screens/all_mlas_view_screen.dart';
import 'package:mla/screens/debit_screen.dart';
import 'package:mla/screens/question_and_answer_screen.dart';
import 'package:o3d/o3d.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:web_browser/web_browser.dart';

// import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

import 'mla_three_d_view.dart';

class MlaHomeScreen extends StatefulWidget {
  String modelUrl;

  MlaHomeScreen(this.modelUrl);

  @override
  _MlaHomeScreenState createState() => _MlaHomeScreenState();
}

class _MlaHomeScreenState extends State<MlaHomeScreen> {
  O3DController o3dController = O3DController();

  var opotionPartyMlaList = [
    {
      "mlaName": "Kalvakuntla Chandrasekhar Rao",
      "partyName": "TRS",
      "mlaImage": "assets/kcr.png",
    },
    {
      "mlaName": "Kalvakuntla Tarakarama rao",
      "partyName": "TRS",
      "mlaImage": "assets/ktr.png",
    },
    {
      "mlaName": "Kavitha",
      "partyName": "TRS",
      "mlaImage": "assets/kavitha.png",
    }
  ];

  var appMlaList = [
    {
      "mlaName": "KCR",
      "percentageToWin": "75%",
      "mlaImage": "assets/Profile1.png",
      "followers": "12K Followers",
    },
    {
      "mlaName": "Full Name",
      "percentageToWin": "75%",
      "mlaImage": "assets/Profile2.png",
      "followers": "12K Followers",
    },
    {
      "mlaName": "Full Name",
      "percentageToWin": "75%",
      "mlaImage": "assets/Profile3.png",
      "followers": "12K Followers",
    },
    {
      "mlaName": "Full Name",
      "percentageToWin": "75%",
      "mlaImage": "assets/Profile2.png",
      "followers": "12K Followers",
    },
    {
      "mlaName": "KCR",
      "percentageToWin": "75%",
      "mlaImage": "assets/Profile1.png",
      "followers": "12K Followers",
    },
  ];

  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  String _glbUrl =
      'https://firebasestorage.googleapis.com/v0/b/forefront-ca776.appspot.com/o/kcrwalkinganimation.glb?alt=media&token=15022fa2-6c20-4c40-b820-ba8a23d48fe1'; // Replace with the URL of your .glb file in Firebase Storage

  Future<void> _loadGLBFile() async {
    print("_loadGLBFile init");
    final Directory systemTempDir = await getTemporaryDirectory();
    final File tempFile = File('${systemTempDir.path}/temp.glb');
    await _firebaseStorage
        .ref('path_to_your_glb_file_in_storage.glb')
        .getData(1024 * 1024 * 100)
        .then((data) async {
      await tempFile.writeAsBytes(data!);
      setState(() {
        _glbUrl = tempFile.path;
        print("Glb file is two:${_glbUrl}");
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // _loadGLBFile();
    // print("Glb file is one:${_glbUrl}");
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.to(AllMlasViewScreen());
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: size.width,
                        height: 80,
                        // color: Colors.grey,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18, right: 18),
                            child: Container(
                              width: size.width,
                              height: size.height / 16,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 2, color: Colors.black),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 10.0),
                                child: Text("Constituency or Name"),
                                /* child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Constituency or Name';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            border: InputBorder.none,
                                            hintText: "Constituency or Name"),
                                      ),
                                    ),
                                    Icon(Icons.search)
                                  ],
                                ),*/
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => QuestionAndAnswerScreen(
                        //           "${widget.modelUrl}",
                        //           "${mlaController.slectedMlaName.value}",
                        //           "${mlaController.slectedMlaImage.value}"
                        //       )),
                        // );
                        Get.to(DebitScreen());
                      },
                      child: Container(
                        // color: Colors.brown,
                        height: 100,
                        padding: EdgeInsets.only(top: 22,right: 12),
                        child: Column(
                          children: [
                            Icon(Icons.arrow_forward,
                                size: 32, color: Colors.black),
                            Text("Debate",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Container(
              //   width: size.width,
              //   height: 400,
              //   child: InkWell(
              //     onTap: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const Mla3DView()),
              //       );
              //     },
              //     // child: Browser(
              //     //   initialUriString: 'https://mla3dwebsite.web.app/',
              //     // ),
              //   ),
              //   color: Colors.grey,
              // ),
              Container(
                width: size.width,
                height: 400,
                // color: Colors.black54,
                // decoration: BoxDecoration(
                //     gradient: LinearGradient(
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   colors: [Color(0xfff4e9f1), Color(0xffb5def2)],
                // )),
                child: Stack(
                  children: [
                    Container(
                      color: Colors.orange,
                      child: Stack(
                        children: [
                          Container(
                            width: size.width,
                            height: size.height,
                            color: Colors.blueAccent,
                            child: YoutubeVideo(
                                "https://www.youtube.com/watch?v=enLxoYo2hI4"),
                          ),
                          Row(
                            children: [
                              Flexible(
                                flex: 30,
                                child: Container(
                                  width: size.width,
                                  height: size.height,
                                  color: Colors.transparent,
                                  /*child: Padding(
                                    padding: const EdgeInsets.only(left: 18.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(builder: (context) => const QuestionAndAnswerScreen()),
                                            // );
                                          },
                                          child: Container(
                                            width: size.width,
                                            height: 150,
                                            color: Colors.blueAccent,
                                            child: YoutubeVideo(
                                                "https://www.youtube.com/watch?v=o9e1q0nN7Ps"),
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text("Why To Vote?",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w700,
                                                      )),
                                                  Image.asset(
                                                    "assets/videoicon.png",
                                                    width: 50,
                                                    height: 50,
                                                  ),
                                                  Expanded(
                                                    child: Image.asset(
                                                      "assets/congress.png",
                                                      width: 50,
                                                      height: 50,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/user.png",
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Obx(() {
                                                    return Text(
                                                        "${mlaController.slectedMlaName.value}",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w400,
                                                        ));
                                                  }),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),*/
                                ),
                              ),
                              Flexible(
                                flex: 40,
                                child: Container(
                                  width: size.width,
                                  height: size.height,
                                  // color: Colors.blueAccent,
                                  child: O3D(
                                    // src: "${mlaController.selectedMlaModel.value}",
                                    src: "${widget.modelUrl}",
                                    // src: "https://firebasestorage.googleapis.com/v0/b/forefront-ca776.appspot.com/o/RevanthReddyHaiAnimation.glb?alt=media&token=7fba1a92-070e-4daa-9e4f-65adbf027c72",
                                    // src: "assets/RevanthReddyWalk.glb",
                                    // src: mlaController.selectedMlaModel == "" ? "https://firebasestorage.googleapis.com/v0/b/forefront-ca776.appspot.com/o/kcrwalkinganimation.glb?alt=media&token=15022fa2-6c20-4c40-b820-ba8a23d48fe1"?"": "${mlaController.selectedMlaModel}",
                                    // src: "https://firebasestorage.googleapis.com/v0/b/forefront-ca776.appspot.com/o/kcrwalkinganimation.glb?alt=media&token=15022fa2-6c20-4c40-b820-ba8a23d48fe1",
                                    controller: o3dController,
                                    ar: true,
                                    autoPlay: true,
                                    // scale: "0",
                                    autoRotate: false,
                                    cameraControls: false,
                                    // cameraTarget: CameraTarget(-.25, 1.5, 1.5),
                                    // cameraOrbit: CameraOrbit(0, 90, 1),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      Get.to(QuestionAndAnswerScreen(
                                          "${widget.modelUrl}",
                                          "${mlaController.slectedMlaName.value}",
                                          "${mlaController.slectedMlaImage.value}"
                                      ));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color:Colors.black,
                                          borderRadius: BorderRadius.circular(18)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            "Why To Vote?",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/videoicon.png",
                                    width: 50,
                                    height: 50,
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Align(
                    //     alignment: Alignment.topRight,
                    //     child: InkWell(
                    //       onTap: () {
                    //         Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => QuestionAndAnswerScreen(
                    //                   "${widget.modelUrl}",
                    //                   "${mlaController.slectedMlaName.value}",
                    //                   "${mlaController.slectedMlaImage.value}"
                    //               )),
                    //         );
                    //       },
                    //       child: Container(
                    //         // color: Colors.brown,
                    //         height: 100,
                    //         child: Column(
                    //           children: [
                    //             Icon(Icons.arrow_forward,
                    //                 size: 32, color: Colors.white),
                    //             Text("Debate",
                    //                 style: TextStyle(
                    //                     fontSize: 12,
                    //                     fontWeight: FontWeight.w300,
                    //                     color: Colors.white))
                    //           ],
                    //         ),
                    //       ),
                    //     ))
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Opponents",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ),
              Container(
                width: size.width,
                // height: 1400,
                // color: Colors.redAccent,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: size.height / 2.5,
                      // color: Colors.grey,
                      child: ListView.builder(
                          itemCount:
                          mlaController.selectedOpponentList.value.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    width: 150,
                                    // height: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        boxShadow: [
                                          new BoxShadow(
                                              color:
                                              Colors.grey.withOpacity(0.5),
                                              blurRadius: 2.0,
                                              spreadRadius: 3.0),
                                        ]),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Image.network(
                                          "${mlaController.selectedOpponentList.value[index].opponentMlaImage}",
                                        ),
                                        Text(
                                          "${mlaController.selectedOpponentList.value[index].opponentMlaName}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "${mlaController.selectedOpponentList.value[index].opponentMlaPartyName}",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 10,
                                        color: Colors.black,
                                      ),
                                      Container(
                                        width: 40,
                                        height: 10,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                          "${double.parse("${mlaController.selectedOpponentList.value[index].opponentPercentageToWin}") * 10}%",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Manifesto",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${mlaController.selectedMlaManifesto.value}",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xffA3A3A3),
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("All Profiles",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              )),
                          InkWell(
                            onTap: () {
                              Get.to(AllMlasViewScreen());
                            },
                            child: Text("More..",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: size.height / 3,
                      // color: Colors.green,
                      child: ListView.builder(
                          itemCount: mlaController.allMlaList.value.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                //mlaController.getMlaModel("${ mlaController.allMlaList[index].mlaModelUrl}");
                                mlaController.getMlaData(
                                  "${mlaController.allMlaList[index].mlaName}",
                                  "${mlaController.allMlaList[index].manifesto}",
                                  mlaController
                                      .allMlaList[index].opponentsMLAs!,
                                  "${mlaController.allMlaList[index].mlaImageUrl}",
                                );
                                Get.offAll(MlaHomeScreen(
                                    "${mlaController.allMlaList[index].mlaModelUrl}"));
                                print(
                                    "opponentsMLAs:  ${mlaController.allMlaList[index].mlaModelUrl}");
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      // width: 150,
                                      // height: 180,
                                      // color: Colors.grey,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                              "${double.parse("${mlaController.allMlaList[index].percentageToWin}") * 100}%",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                              )),
                                          CircularPercentIndicator(
                                            radius: 60.0,
                                            lineWidth: 15.0,
                                            // percent: double.parse("${mlaController.allMlaList[index].percentageToWin}"),
                                            percent: 0.5,
                                            center: CircleAvatar(
                                              radius: 55,
                                              backgroundColor:
                                              Colors.transparent,
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                    5), // Border radius
                                                child: ClipOval(
                                                    child: Image.network(
                                                        '${mlaController.allMlaList[index].mlaImageUrl}')),
                                              ),
                                            ),
                                            // center: const CircleAvatar(
                                            //   radius: 55, // Image radius
                                            //   backgroundImage: NetworkImage('https://resize.indiatvnews.com/en/resize/newbucket/715_-/2020/02/srk-1582818093.jpg'),
                                            // ),
                                            progressColor: Color(0xffB9331B),
                                          ),
                                          Text(
                                              "${mlaController.allMlaList[index].mlaName}",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              )),
                                          Text(
                                              "${mlaController.allMlaList[index].noOfFlowwers} Followers",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w300,
                                              )),

                                          // SizedBox(
                                          //   height: 10,
                                          // ),
                                          // Text(
                                          //   "${opotionPartyMlaList[index]["mlaName"]}",
                                          //   textAlign: TextAlign.center,
                                          //   style: TextStyle(
                                          //     fontSize: 12,
                                          //     fontWeight: FontWeight.w500,
                                          //   ),
                                          // ),
                                          // Text(
                                          //     "${opotionPartyMlaList[index]["partyName"]}"),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 18,
                                    ),
                                    // Expanded(
                                    //   child: Container(
                                    //     width: 100,
                                    //     height: 150,
                                    //     color: Colors.blueAccent,
                                    //     child: YoutubeVideo(
                                    //         "https://www.youtube.com/watch?v=o9e1q0nN7Ps"),
                                    //   ),
                                    // )
                                    /*SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 10,
                                          color: Colors.black,
                                        ),
                                        Container(
                                          width: 40,
                                          height: 10,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text("48%",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                            ))
                                      ],
                                    )*/
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
