import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mla/screens/mla_home_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../MlasYoutubeVideo.dart';
import '../constants/app_controller.dart';

class AllMlasViewScreen extends StatefulWidget {
  const AllMlasViewScreen({Key? key}) : super(key: key);

  @override
  _AllMlasViewScreenState createState() => _AllMlasViewScreenState();
}

class _AllMlasViewScreenState extends State<AllMlasViewScreen> {

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
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Row(

                children: [
                  SizedBox(
                    width: 12,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
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
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                  ),
                  itemCount: mlaController.allMlaList.value.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              mlaController.getMlaData(
                                "${mlaController.allMlaList[index].mlaName}",
                                "${mlaController.allMlaList[index].manifesto}",
                                mlaController.allMlaList[index].opponentsMLAs!,
                                "${mlaController.allMlaList[index].mlaImageUrl}",
                              );
                              Get.offAll(MlaHomeScreen("${mlaController.allMlaList[index].mlaModelUrl}"));
                              print("opponentsMLAs: ${mlaController.allMlaList[index].opponentsMLAs!.length}");
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${double.parse("${mlaController.allMlaList[index].percentageToWin}") * 100}%",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                CircularPercentIndicator(
                                  radius: 60.0,
                                  lineWidth: 15.0,
                                  percent: 0.5,
                                  center: CircleAvatar(
                                    radius: 55,
                                    backgroundColor: Colors.transparent,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: ClipOval(child: Image.network('${mlaController.allMlaList[index].mlaImageUrl}')),
                                    ),
                                  ),
                                  progressColor: Color(0xffB9331B),
                                ),
                                Text(
                                  "${mlaController.allMlaList[index].mlaName}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "${mlaController.allMlaList[index].noOfFlowwers} Followers",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),


                        ],
                      ),
                    );
                  },
                )
                ,
              ),
            ],
          )
          ,
        ),
      ),
    );
  }
}
