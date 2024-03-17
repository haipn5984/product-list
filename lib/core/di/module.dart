import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:product_list/core/network/dio_config.dart';
import 'package:product_list/data/repository_impl/product_repository_impl.dart';
import 'package:product_list/data/service/product_service.dart';
import 'package:product_list/domain/repositoty/product_repository.dart';
import 'package:product_list/presentation/products/bloc/cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  //Service
  getIt.registerSingleton(ProductService(provideDio()));
  //Repo
  getIt.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(getIt()));
//Feature - Product
//Bloc
  getIt.registerFactory(() => ProductCubit());

  final sharedPreferences = await SharedPreferences.getInstance();
  const secureStorage = FlutterSecureStorage();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => secureStorage);
}
