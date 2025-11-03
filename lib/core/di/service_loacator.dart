
import 'package:ecommerce/core/di/service_loacator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt serviceLocator = GetIt.instance;

@InjectableInit()
void configureDependencies() => serviceLocator.init();

