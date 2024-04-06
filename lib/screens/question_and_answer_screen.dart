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
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.hCfHyL8u8XAbreXuaiTMQgHaHZ?w=207&h=206&c=7&r=0&o=5&pid=1.7"),
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
                            "The BJP's influence varies across different states in India. A decline in the BJP's fortunes could have varying impacts at the state level, potentially leading to changes in regional politics and governance structures.",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.WHWPRzfbMH4pdOc9DraUNgHaHa?w=169&h=180&c=7&r=0&o=5&pid=1.7"),
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
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.0E145qm-Fzl6vKoqsFUZSAHaHa?w=185&h=185&c=7&r=0&o=5&pid=1.7"),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text("Rajesh Kumar",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ))
                          ],
                        ),
                        Text("Do you think Telangana needs another regional party?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )),
                        Text(
                            "Not a regional party, but YES, we need an alternate.Not having an alternate is too dangerous on a long run. No opposition would make the ruling party go on a dictator mode and leads way to agitation. Loot becomes but natural. Havoc is a daily scene. Development hardly happens. Goons everywhere. Security is forgotten.",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.sKncjwtyVgGKNW4CXKB3NQHaHa?w=180&h=180&c=7&r=0&o=5&pid=1.7"),
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
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.1aDDK3nqW9uqEdGWo8TNOgAAAA?w=178&h=180&c=7&r=0&o=5&pid=1.7"),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text("Savitha Kumari",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ))
                          ],
                        ),
                        Text("How and why did the Congress Party win the Telangana election?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )),
                        Text(
                            "It was assumed KCR would have a hat trick this time, and win easily. With both the Opposition parties(BJP, Congress) preoccupied with their own infighting, it seemed another win for granted. But beyond all the gushing PR, the drone shots of glass and steel buildings in Hyderabad, flyovers, things were not as rosy.",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage("https://th.bing.com/th/id/OIF.Z98hcWFx9WyLactdW0JPhQ?w=173&h=180&c=7&r=0&o=5&pid=1.7"),
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
