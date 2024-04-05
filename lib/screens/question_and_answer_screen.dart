import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mla/screens/profile_screen.dart';
import 'package:o3d/o3d.dart';
import 'package:video_player/video_player.dart';

import '../MlasYoutubeVideo.dart';

class QuestionAndAnswerScreen extends StatefulWidget {
  String modelUrl;
  String mlaName;
  String mlaImage;

  QuestionAndAnswerScreen(this.modelUrl, this.mlaName,this.mlaImage);

  @override
  _QuestionAndAnswerScreenState createState() =>
      _QuestionAndAnswerScreenState();
}

class _QuestionAndAnswerScreenState extends State<QuestionAndAnswerScreen> {
  var opotionPartyMlaList = [
    {
      "mlaName": "Debate Video",
      "partyName": "Upload a Video",
      "mlaImage": "assets/kcr_video.png",
    },
    {
      "mlaName": "Local Party Video",
      "partyName": "Upload a Video",
      "mlaImage": "assets/kcr_video.png",
    },
    {
      "mlaName": "About Vote",
      "partyName": "Upload a Video",
      "mlaImage": "assets/kcr_video.png",
    }
  ];

  O3DController o3dController = O3DController();
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();

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

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 12,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(25)),
                        child: Icon(Icons.arrow_back_rounded)),
                  ),
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
                                border:
                                    Border.all(width: 2, color: Colors.black),
                                borderRadius: BorderRadius.circular(25)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 3.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Search Place or MLA';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          border: InputBorder.none,
                                          hintText: "Search Place or MLA"),
                                    ),
                                  ),
                                  Icon(Icons.search)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: size.height / 4.3,
                // color: Colors.grey,
                child: ListView.builder(
                    itemCount: opotionPartyMlaList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 150,
                          child: Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "${opotionPartyMlaList[index]["mlaImage"]}",
                                  scale: 0.3,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "${opotionPartyMlaList[index]["mlaName"]}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(22.5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16, top: 4, bottom: 4),
                                    child: Text(
                                      "${opotionPartyMlaList[index]["partyName"]}",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                width: size.width,
                height: 400,
                // color: Colors.red,
                /* decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xfff4e9f1), Color(0xffb5def2)],
                    )),*/
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 50,
                          child: Container(
                            width: size.width,
                            height: size.height,
                            // color: Colors.lime,
                           /* child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  // margin: EdgeInsets.only(top: 30,left: 33),
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(top: 200, right: 33),
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(top: 150, left: 100),
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: _controller.value.isInitialized
                                        ? VideoPlayer(_controller)
                                        : Container(
                                            child: Text("hh"),
                                          ),
                                  ),
                                ),
                                // ClipRRect(
                                //   borderRadius: BorderRadius.circular(1000.0),
                                //   // clipBehavior: Clip.hardEdge,
                                //   child: _controller.value.isInitialized
                                //       ? AspectRatio(
                                //           aspectRatio:
                                //               _controller.value.aspectRatio / 1,
                                //           child: VideoPlayer(_controller),
                                //         )
                                //       : Container(
                                //           child: Text("hh"),
                                //         ),
                                // ),
                              ],
                            ),*/
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                            Container(
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
                                            Image.asset(
                                              "assets/videoicon.png",
                                              width: 50,
                                              height: 50,
                                            ),

                                          ],
                                        ),
                                        Row(
                                          children: [
                                            // Image.asset("assets/user.png",),
                                            CircleAvatar(
                                              radius: 20,
                                              backgroundColor: Colors.green,
                                              backgroundImage: NetworkImage("${widget.mlaImage}"),
                                            ),
                                            SizedBox(width: 8,),
                                            Expanded(
                                              child: Text("${widget.mlaName}",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 40,
                          child: Container(
                            width: size.width,
                            height: size.height,
                            // color: Colors.blueAccent,
                            child: O3D(
                              src: "${widget.modelUrl}",
                              // src: "assets/RevanthReddyWalk.glb",
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
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen(
                                  "${widget.modelUrl}", "${widget.mlaName}")),
                        );
                      },
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            // color: Colors.orange,
                            height: 100,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.arrow_forward,
                                  size: 32,
                                ),
                                Text("Profile",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ))
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 38, right: 12),
                  child: Text("Ask a Questions? to ${widget.mlaName}",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: size.width,
                  // height: size.height/6,

                  decoration: BoxDecoration(
                      boxShadow: [
                        new BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 2.0,
                            spreadRadius: 3.0),
                      ],
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 18, color: Colors.black),
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text("Narayan Reddy",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ))
                          ],
                        ),
                        Text("What happens if BJP fails out?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )),
                        Text(
                            "Lorem Ipsum is simply dummy text of the printig pesetting industry.",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 18, color: Colors.black),
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    hintText: "Write Your Answer"),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.black),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Text("Yes",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.black),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12),
                                  child: Text("No",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.message_rounded,
                              color: Colors.black,
                            ),
                            Text("200 Answers",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: size.width,
                  // height: size.height/6,

                  decoration: BoxDecoration(
                      boxShadow: [
                        new BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 2.0,
                            spreadRadius: 3.0),
                      ],
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 18, color: Colors.black),
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text("Narayan Reddy",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ))
                          ],
                        ),
                        Text("What happens if BJP fails out?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )),
                        Text(
                            "Lorem Ipsum is simply dummy text of the printig pesetting industry.",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 18, color: Colors.black),
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    hintText: "Write Your Answer"),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.black),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Text("Yes",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.black),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12),
                                  child: Text("No",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Icon(
                          Icons.message_rounded,
                          color: Colors.black,
                        ),
                        Text("200 Answers",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: size.width,
                  // height: size.height/6,

                  decoration: BoxDecoration(
                      boxShadow: [
                        new BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 2.0,
                            spreadRadius: 3.0),
                      ],
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 18, color: Colors.black),
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text("Narayan Reddy",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ))
                          ],
                        ),
                        Text("What happens if BJP fails out?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )),
                        Text(
                            "Lorem Ipsum is simply dummy text of the printig pesetting industry.",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 18, color: Colors.black),
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    hintText: "Write Your Answer"),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.black),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Text("Yes",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.black),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12),
                                  child: Text("No",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Icon(
                          Icons.message_rounded,
                          color: Colors.black,
                        ),
                        Text("200 Answers",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
