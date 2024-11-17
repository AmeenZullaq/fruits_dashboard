import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart';

class FirebaseStorageService extends StorageService {
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadFile({required File file, required path}) async {
    // get the name of the file
    String fileName = basename(file.path);
    // get the extension of the filoe like png
    String fileExtension = extension(file.path);
    final fileRef = storageRef.child('$path/$fileName.$fileExtension');
    await fileRef.putFile(file);
    String fileUrl = await fileRef.getDownloadURL();
    return fileUrl;
  }
}
