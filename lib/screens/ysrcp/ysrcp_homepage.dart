import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mla/screens/ysrcp/volnteer_screen.dart';
import 'package:o3d/o3d.dart';
import 'package:video_player/video_player.dart';

import '../../MlasYoutubeVideo.dart';
import 'aarogyasree_screen.dart';

class YsrCpHomePage extends StatefulWidget {
  const YsrCpHomePage({Key? key}) : super(key: key);

  @override
  _YsrCpHomePageState createState() => _YsrCpHomePageState();
}

class _YsrCpHomePageState extends State<YsrCpHomePage> {
  O3DController JaganReddyHaiAnimationController = O3DController();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   setState(() {
  //     // JaganReddyHaiAnimationController.animationName  = 'Armature|Take';
  //     // JaganReddyHaiAnimationController.animationName  = 'Key|Take';
  //   });
  // }

  var YsrOpponentsList = [
    {
      "name": "Chandrababu Naidu",
      "locationAndPartyName": "TDP",
      "image": "assets/cnd.png"
    },
    {
      "name": "Pavan Kalyan",
      "locationAndPartyName": "Janasena",
      "image": "assets/pk.png"
    },
    {
      "name": "Sharmila Reddy",
      "locationAndPartyName": "Congress",
      "image": "assets/slr.png"
    }
  ];

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://firebasestorage.googleapis.com/v0/b/forefront-ca776.appspot.com/o/videos%2FAP%20CM%20YS%20Jagan%20Simplicity%20_%20CM%20YS%20Jagan%20Interaction%20With%20Fl.mp4?alt=media&token=65ac9c37-9c20-45d4-be13-667ceced85e4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
          // _controller.setLooping(true);
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: size.width,
          height: size.height,
          // color: Colors.blueAccent,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: size.width,
                  height: size.height / 1.5,
                  // color: Colors.cyan,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 3),
                        width: size.width,
                        height: size.height / 4,
                        // color: Colors.red,
                        child: YoutubeVideo(
                            "https://www.youtube.com/watch?v=Ne7Do0-HNzY"),
                      ),
                      // Align(
                      //   alignment: Alignment.bottomLeft,
                      //   child: Container(
                      //     margin: EdgeInsets.only(left: 38, bottom: 132),
                      //     width: 150,
                      //     height: 100,
                      //     decoration: BoxDecoration(
                      //         // color: Colors.red,
                      //         borderRadius: BorderRadius.circular(100)),
                      //     child: _controller.value.isInitialized
                      //         ? VideoPlayer(_controller)
                      //         : Container(),
                      //   ),
                      // ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: O3D(
                          // src: "${mlaController.selectedMlaModel.value}",
                          // src: "${widget.modelUrl}",
                          // src: "https://firebasestorage.googleapis.com/v0/b/forefront-ca776.appspot.com/o/ysjagananimationmodelfinalto.glb?alt=media&token=a19cf880-942c-4edf-8c75-b51dcb2d486f",
                          src: "assets/JaganFinalAnimationHii.glb",
                          // src: mlaController.selectedMlaModel == "" ? "https://firebasestorage.googleapis.com/v0/b/forefront-ca776.appspot.com/o/kcrwalkinganimation.glb?alt=media&token=15022fa2-6c20-4c40-b820-ba8a23d48fe1"?"": "${mlaController.selectedMlaModel}",
                          // src: "https://firebasestorage.googleapis.com/v0/b/forefront-ca776.appspot.com/o/kcrwalkinganimation.glb?alt=media&token=15022fa2-6c20-4c40-b820-ba8a23d48fe1",
                          controller: JaganReddyHaiAnimationController,
                          ar: true,
                          autoPlay: true,
                          autoRotate: false,
                          cameraControls: false,
                          // scale: "0",
                          // autoRotate: true,
                          // cameraControls: true,
                          // cameraTarget: CameraTarget(-.25, 1.5, 1.5),
                          // cameraOrbit: CameraOrbit(0, 90, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width,
                  // height: size.height,
                  // color: Colors.blueAccent,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Opponents",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ),
                      Container(
                        height: size.height / 4.5,
                        // color: Colors.grey,
                        child: ListView.builder(
                            itemCount: YsrOpponentsList.length,
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
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: Colors.white,
                                          boxShadow: [
                                            new BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                blurRadius: 2.0,
                                                spreadRadius: 3.0),
                                          ]),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "${YsrOpponentsList[index]["image"]}",
                                          ),
                                          Text(
                                            "${YsrOpponentsList[index]["name"]}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            "${YsrOpponentsList[index]["locationAndPartyName"]}",
                                            style: TextStyle(
                                                color: Color(0xff757575)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Apps",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.to(AarogyasreeScreen());
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: size.width / 1.1,
                                  height: size.height / 18,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22.5),
                                    color: Colors.black,
                                  ),
                                  child: Center(
                                    child: Text("Aarogyasree",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.to(VolunteerScreen());
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: size.width / 1.1,
                                  height: size.height / 18,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22.5),
                                    color: Colors.black,
                                  ),
                                  child: Center(
                                    child: Text("Volunteer",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                      ),
                      InkWell(
                        onTap: (){
                          Get.to(RegisterCompleant());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: size.width,
                            height: size.height / 18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22.5),
                              color: Colors.black,
                            ),
                            child: Center(
                              child: Text("Register a Complaint",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Manifesto",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ),
                      Image.asset("assets/manifest.png"),
                      SizedBox(
                        height: 82,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     // print("object is clicked ${JaganReddyHaiAnimationController"}");
        //     // JaganReddyHaiAnimationController.play(repetitions: 0);
        //     // JaganReddyHaiAnimationController.animationName  = 'Key|Take 001|BaseLayer';
        //     // JaganReddyHaiAnimationController.animationName  = 'Armature|Take 001|BaseLayer';
        //     log("Available animations: ${await JaganReddyHaiAnimationController.availableAnimations()}");
        //   },
        //   child: Icon(Icons.play_arrow),
        // ),
      ),
    );
  }
  void modalBottomSheetMenu(BuildContext context){
    var size = MediaQuery.of(context).size;
    var lanuageList = [
      "Telugu",
      "Hindi",
      "English",
    ];
    var selectedLanguage = 0;

    showModalBottomSheet(
        context: context,
        builder: (builder){
          return new Container(
            height: 1500.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: new Center(
                  child: SingleChildScrollView(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 22,),
                        Text("Register Complaint",style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500
                        ),),
                        SizedBox(height: 12,),
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
                                  fillColor: Colors.white,
                                  border: InputBorder.none,
                                  hintText: "Name"),
                            ),
                          ),
                        ),
                        SizedBox(height: 12,),
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
                                  return 'Please enter Mobile Number';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  border: InputBorder.none,
                                  hintText: "Mobile Number"),
                            ),
                          ),
                        ),
                        SizedBox(height: 12,),
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
                                  return 'Please enter Age';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  border: InputBorder.none,
                                  hintText: "Age"),
                            ),
                          ),
                        ),
                        SizedBox(height: 12,),
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
                                  return 'Please enter Location';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  border: InputBorder.none,
                                  hintText: "Location"),
                            ),
                          ),
                        ),
                        SizedBox(height: 12,),
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
                                  return 'Brief about issue';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  border: InputBorder.none,
                                  hintText: "Brief about issue"),
                            ),
                          ),
                        ),
                        SizedBox(height: 12,),
                        Container(
                          width: size.width / 1.1,
                          height: size.height / 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22.5),
                            color: Colors.black,),
                          child: Center(
                            child: Text("Submit",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                        ),
                        SizedBox(height: 12,),
                      ],
                    ),
                  ),
                )),
          );
        }
    );
  }
}

class RegisterCompleant extends StatelessWidget {
  const RegisterCompleant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Register Complaint",style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500
          ),),
        ),
        body: Container(
          height: 1500.0,
          color: Colors.transparent, //could change this to Color(0xFF737373),
          //so you don't have to change MaterialApp canvasColor
          child: new Container(
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0))),
              child: new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

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
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              hintText: "Name"),
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
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
                              return 'Please enter Mobile Number';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              hintText: "Mobile Number"),
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
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
                              return 'Please enter Age';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              hintText: "Age"),
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
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
                              return 'Please enter Location';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              hintText: "Location"),
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
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
                              return 'Brief about issue';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              hintText: "Brief about issue"),
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
                    Spacer(),
                    Container(
                      width: size.width / 1.1,
                      height: size.height / 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22.5),
                        color: Colors.black,),
                      child: Center(
                        child: Text("Submit",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                    ),
                    SizedBox(height: 12,),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
