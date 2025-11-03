import 'package:dio/dio.dart';
import 'package:ecommerce/core/constant.dart';
import 'package:ecommerce/features/auth/presentation/auth_cubit.dart';
import 'package:ecommerce/features/auth/screens/data/data_source/local/auth_local_data_source.dart';
import 'package:ecommerce/features/auth/screens/data/data_source/local/auth_sherd_data_source.dart';
import 'package:ecommerce/features/auth/screens/data/data_source/remote/auth_api_remote_data_source.dart';
import 'package:ecommerce/features/auth/screens/data/data_source/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/screens/data/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'service_loacator.config.dart';

final GetIt serviceLocator = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() async {
  // Pre-resolve SharedPreferences asynchronously
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerSingleton<SharedPreferences>(sharedPreferences);
  
  // Initialize other dependencies
  serviceLocator.init();
}
