

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Picker extends StatefulWidget {

  void Function (File img) imgUpload ;

  Picker(this.imgUpload);
  @override
  PickerState createState() => PickerState();
}

class PickerState extends State<Picker> {
  late File _image;
  var imagePicker;
  var finalimg;



  @override
  void initState() {
    super.initState();
    imagePicker = new ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    void pick() async {
      XFile image = await imagePicker.pickImage(
          source: ImageSource.camera,
          preferredCameraDevice: CameraDevice.front,
        imageQuality: 15,
      );
      setState(() {
        _image = File(image.path);
       finalimg = Image.file(_image).image;
       widget.imgUpload(_image);
      });
    }


    return Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: finalimg,
            radius: 35,

          ),
          TextButton.icon(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Theme
                    .of(context)
                    .colorScheme
                    .primary,)
            ),
            onPressed: pick,
            icon: const Icon(Icons.image,),
            label: const Text('Add image'),
          ),
        ]);
  }
}