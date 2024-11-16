import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage() async {
  ImagePicker picker = ImagePicker();
  XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
  if (pickedImage != null) {
    return File(pickedImage.path);
  }
  return null;
}
