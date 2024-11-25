import 'dart:io';
import 'package:fruits_dashboard/core/services/storage_service.dart';
import 'package:fruits_dashboard/core/utils/app_strings.dart';
import 'package:path/path.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService extends StorageService {
  // Get the Supabase client instance
  SupabaseStorageClient supabaseStorage = Supabase.instance.client.storage;
  @override
  Future<String> uploadFile({
    required File file,
    required String path,
  }) async {
    // get the name of the file.
    String fileName = basename(file.path);
    // get the extension of the file, like png.
    String fileExtension = extension(file.path);
    // file path
    String filePath = '$fileName$fileExtension';
    // Upload the file to the specified bucket and path
    await supabaseStorage.from(AppStrings.bucketName).upload(filePath, file);
    // Generate a public URL for the uploaded file
    String publicUrl =
        supabaseStorage.from(AppStrings.bucketName).getPublicUrl(path);
    return publicUrl;
  }

}
