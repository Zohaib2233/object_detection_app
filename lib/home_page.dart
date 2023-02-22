import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'main.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isWorking =false;
  String result ="";
  CameraController? cameraController;
  CameraImage? imgCamera;

  initCamera(){
    cameraController = CameraController(cameras?[0], ResolutionPreset.medium);
    cameraController?.initialize().then((value){
      if(!mounted){
        return;
      }
      setState(() {
        cameraController?.startImageStream((imageFromStream) =>
        {
          if(!isWorking)
          {
            isWorking =true,
            imgCamera = imageFromStream,
          }
        });
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('images/jarvis.jpg'),
              ),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      color: Colors.black,
                      height: 320,
                      width: 360,
                      child: Image.asset('images/camera.jpg'),
                    ),
                    TextButton(onPressed: (){
                      initCamera();
                    },
                        child:Container(
                          margin: EdgeInsets.only(top: 35),
                          height: 270,
                          width: 360,
                          child: imgCamera == null ?
                          Container(
                            height: 270,
                            width: 360,
                            child: Icon(Icons.camera,size: 40,color: Colors.blue,),
                          ):AspectRatio(aspectRatio: cameraController?.value.aspectRatio as double,
                            child:CameraPreview(cameraController),),
                        ) )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
