import 'package:fruits_dashboard/core/services/database_service.dart';
import 'package:fruits_dashboard/core/services/supabase_storage_service.dart';
import 'package:fruits_dashboard/core/services/firestore_service.dart';
import 'package:fruits_dashboard/core/services/storage_service.dart';
import 'package:fruits_dashboard/features/add_product/data/repos_impl/product_repo_impl.dart';
import 'package:fruits_dashboard/features/add_product/domain/repos/product_repo.dart';
import 'package:fruits_dashboard/features/add_product/presentation/cubits/add_product_cubit/add_product_cubit.dart';
import 'package:get_it/get_it.dart';

abstract class InjectionContainer {
  static GetIt getIt = GetIt.instance;

  static Future<void> initAppDependencies() async {
    await initAddProductDependencies();
  }

  static Future<void> initAddProductDependencies() async {
    /// Data source
    getIt.registerLazySingleton<DatabaseService>(
      () => FirestoreService(),
    );
    getIt.registerLazySingleton<StorageService>(
      () => SupabaseStorageService(),
    );

    /// Repos
    getIt.registerLazySingleton<ProductRepo>(
      () => ProductRepoImpl(
        storageService: getIt.get<StorageService>(),
        databaseService: getIt.get<DatabaseService>(),
      ),
    );

    /// Cubits
    getIt.registerLazySingleton<AddProductCubit>(
      () => AddProductCubit(
        productRepo: getIt.get<ProductRepo>(),
      ),
    );
  }
}
