import 'dart:async';

import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
class HomePage extends StatefulWidget{
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  String text = "Hey there";
  Future getQRScanner() async {
    try{
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        text = qrResult;
      });
    } on PlatformException catch (e) {
      if(e.code == BarcodeScanner.CameraAccessDenied){
        setState(() {
          text = "Camera permission denied";
        });
      }else
        {
          setState(() {
            text = "Unknown Error $e";
          });
        }
    } on FormatException {
      setState(() {
        text = "Back button pressed";
      });
    }
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Center(child: Text(text)),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){ getQRScanner();},
          icon: Icon(Icons.camera),
          label: Text("Scan")
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}