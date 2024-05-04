import 'dart:typed_data';

class ChangeImgData {
  String startImg;
  bool isSet;
  Uint8List? img;
  ChangeImgData({
    required this.startImg,
    required this.isSet,
    this.img
  });
}