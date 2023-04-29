import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class picture extends ChangeNotifier {
  File? _pickedImage;
  ImagePicker? imagePicker;
  final ImagePicker _picker = ImagePicker();
  addCamera() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    _pickedImage = File(pickedFile!.path);
    if (_pickedImage != null) {
      _pickedImage;
      notifyListeners();

    }else {
    
    }
  }
    addGallery() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    _pickedImage = File(pickedFile!.path);
    if (_pickedImage != null) {
      _pickedImage;
      notifyListeners();

    }else {
    
    }
  }
}
