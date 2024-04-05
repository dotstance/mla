import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';
class MlaViewScreen extends StatefulWidget {
  const MlaViewScreen({super.key});

  @override
  State<MlaViewScreen> createState() => _MlaViewScreenState();
}

class _MlaViewScreenState extends State<MlaViewScreen> {
  O3DController o3dController = O3DController();
  PageController mainPageController = PageController();
  PageController textsPageController = PageController();
  int page = 0;

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.sizeOf(context).height;

    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SafeArea(
        child:  Container(
          width: size.width,
          height: size.height/1.3,
          child: O3D(
            src: 'assets/dsrhaianim.glb',
            controller: o3dController,
            ar: false,
            autoPlay: true,
            autoRotate: false,
            cameraControls: false,
            // cameraTarget: CameraTarget(.000001, 1.5, 1.5),
            // cameraTarget: CameraTarget(2.0, 0.0, 0.0),

            // cameraTarget: CameraTarget(.75, 0.5, 4.5),
            // cameraOrbit: CameraOrbit(0, 90, 1),
          ),
        ),
      ),

    );
  }
}
