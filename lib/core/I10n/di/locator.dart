import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/I10n/local/hive_storage.dart';
import 'package:ecommerce_app/data/dio/dio_client.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

class ServiceLocator {
  Future<void> servicesLocator() async {
    final storage = GlobalStorageImpl();
    await storage.init();

    // 🟢 Đăng ký GlobalStorage
    getIt.registerSingleton<GlobalStorage>(storage);

    // 🟢 Đăng ký Dio và API Client
    final dio = Dio();
    getIt.registerSingleton<DioClient>(DioClient(dio, getIt<GlobalStorage>()));

    // 🟢 Đăng ký DataSource

    // 🟢 Đăng ký Repository

    // 🟢 Đăng ký UseCase

    // 🟢 Đăng ký Bloc
  }
}
