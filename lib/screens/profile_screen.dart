import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

class ProfileScreen extends StatefulWidget {
  String modelUrl;
  String mlaName;
  ProfileScreen(this.modelUrl,this.mlaName);


  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  O3DController o3dController = O3DController();

  var opotionPartyMlaList = [
    {
      "mlaName": "Kalvakuntla Chandrasekhar Rao",
      "mlaImage": "assets/kcr.png",
    },
    {
      "mlaName": "Kalvakuntla Tarakarama rao",
      "mlaImage": "assets/ktr.png",
    },
    {
      "mlaName": "Kavitha",
      "mlaImage": "assets/kavitha.png",
    }
  ];

  void modalBottomSheetMenu(){
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
            height: 550.0,
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
                )),
          );
        }
    );
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
                    ),

                  ),
                ],
              ),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 150,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 450,
                    // color: Colors.blueAccent,
                    child: O3D(
                      src: "${widget.modelUrl}",
                      // src: 'assets/RevanthReddyHaiAnimation.glb',
                      controller: o3dController,
                      ar: false,
                      autoPlay: true,
                      // scale: "0",
                      autoRotate: false,
                      cameraControls: false,
                      // cameraTarget: CameraTarget(-.25, 1.5, 1.5),
                      // cameraOrbit: CameraOrbit(0, 90, 1),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 150,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 300),
                    width: size.width,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Text(
                            "${widget.mlaName}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            )
                        ),
                        // Text(
                        //     "Kamareddy, and Kodangal",
                        //     style: TextStyle(
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.w400,
                        //     )
                        // ),

                        SizedBox(height: 22,),
                        Text(
                            "Complaint Registration",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                            )
                        ),
                        SizedBox(height: 12,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap:(){
                                modalBottomSheetMenu();
                              },
                              child: Container(
                                width: 143,
                                height: 45,
                                decoration:     BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black),
                                child: Center(
                                  child: Text(
                                      "Grampanchayat",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      )
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap:(){
                                modalBottomSheetMenu();
                              },
                              child: Container(
                                width: 143,
                                height: 45,
                                decoration:     BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black),
                                child: Center(
                                  child: Text(
                                      "Revenue",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      )
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap:(){
                                modalBottomSheetMenu();
                              },
                              child: Container(
                                width: 143,
                                height: 45,
                                decoration:     BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black),
                                child: Center(
                                  child: Text(
                                      "Law and order",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      )
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap:(){
                                modalBottomSheetMenu();
                              },
                              child: Container(
                                width: 143,
                                height: 45,
                                decoration:     BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black),
                                child: Center(
                                  child: Text(
                                      "Muncipality",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      )
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap:(){
                                modalBottomSheetMenu();
                              },
                              child: Container(
                                width: 143,
                                height: 45,
                                decoration:     BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black),
                                child: Center(
                                  child: Text(
                                      "Education",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      )
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap:(){
                                modalBottomSheetMenu();
                              },
                              child: Container(
                                width: 143,
                                height: 45,
                                decoration:     BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black),
                                child: Center(
                                  child: Text(
                                      "Health",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      )
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap:(){
                                modalBottomSheetMenu();
                              },
                              child: Container(
                                width: 143,
                                height: 45,
                                decoration:     BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black),
                                child: Center(
                                  child: Text(
                                      "Welfare",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      )
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 143,
                              height: 45,

                            ),
                          ],
                        ),
                        SizedBox(height: 12,),
                        Text(
                            "Complaints in your area",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffDC8E46),
                              fontWeight: FontWeight.w700,
                            )
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
                                    width: 180,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        boxShadow: [new BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            blurRadius: 2.0,
                                            spreadRadius:3.0
                                        ),]

                                    ),
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
                                        Expanded(
                                          child: Text(
                                              "Lorem Ipsum is simply dummy text of the printig pesetting industry.",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              )
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                "Responded By",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width: size.width,
                            // height: size.height/6,

                            decoration: BoxDecoration(
                                boxShadow: [new BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 2.0,
                                    spreadRadius:3.0
                                ),],
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
                                            border: Border.all(width: 18, color: Colors.black),
                                            borderRadius: BorderRadius.circular(25)),
                                      ),
                                      SizedBox(width: 12,),
                                      Text(
                                          "Narayan Reddy",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          )
                                      )
                                    ],
                                  ),

                                  Text(
                                      "Lorem Ipsum is simply dummy text of the printig pesetting industry.",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      )
                                  ),


                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                                " 15 days resolve your issue",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xffDC8E46),
                                  fontWeight: FontWeight.w500,
                                )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                "Comments",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width: size.width,
                            // height: size.height/6,

                            decoration: BoxDecoration(
                                boxShadow: [new BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 2.0,
                                    spreadRadius:3.0
                                ),],
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
                                            border: Border.all(width: 18, color: Colors.black),
                                            borderRadius: BorderRadius.circular(25)),
                                      ),
                                      SizedBox(width: 12,),
                                      Text(
                                          "Narayan Reddy",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          )
                                      )
                                    ],
                                  ),

                                  Text(
                                      "Lorem Ipsum is simply dummy text of the printig pesetting industry.",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      )
                                  ),


                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                                "More...",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                )
                            ),
                          ),
                        ),
                        SizedBox(height: 22,)

                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
