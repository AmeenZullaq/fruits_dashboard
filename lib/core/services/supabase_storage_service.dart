import 'dart:io';
import 'package:fruits_dashboard/core/services/storage_service.dart';
import 'package:fruits_dashboard/core/utils/app_strings.dart';
import 'package:path/path.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService extends StorageService {
  // Get the Supabase client instance
  static SupabaseStorageClient supabaseStorage =
      Supabase.instance.client.storage;

// create bucket using code, the recomended way is create bucket from supabase consol
  static createBucket({required String bucketName}) async {
    // List all buckets
    final buckets = await supabaseStorage.listBuckets();
    // Check if the bucket already exists
    final bucketExists = buckets.any(
      (bucket) => bucket.name == bucketName,
    );
    if (!bucketExists) {
      // create a bucet
      await supabaseStorage.createBucket(
        AppStrings.fruitImages,
        const BucketOptions(public: true),
      );
    }
  }

  @override
  Future<String> uploadFile({
    required File file,
    required String path,
  }) async {
    // get the name of the file.
    String fileName = basename(file.path);
    // get the extension of the file, like png.
    String extensionName = extension(file.path);
    // file path
    String filePath = '$path/$fileName.$extensionName';
    // Upload the file to the specified bucket and path
    await supabaseStorage.from(AppStrings.fruitImages).upload(filePath, file);
    // Generate a public URL for the uploaded file
    String publicUrl =
        supabaseStorage.from(AppStrings.fruitImages).getPublicUrl(filePath);
    return publicUrl;
  }
}
