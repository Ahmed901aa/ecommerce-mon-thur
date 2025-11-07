// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/domain/repositries/auth_repositires.dart' as _i927;
import '../../features/auth/domain/use_cases/login_use_cases.dart' as _i541;
import '../../features/auth/domain/use_cases/register_use_cases.dart' as _i577;
import '../../features/auth/presentation/auth_cubit.dart' as _i731;
import '../../features/auth/screens/data/data_source/local/auth_local_data_source.dart'
    as _i841;
import '../../features/auth/screens/data/data_source/local/auth_sherd_data_source.dart'
    as _i490;
import '../../features/auth/screens/data/data_source/remote/auth_api_remote_data_source.dart'
    as _i632;
import '../../features/auth/screens/data/data_source/remote/auth_remote_data_source.dart'
    as _i390;
import '../../features/auth/screens/data/repositories/auth_repository_impl.dart'
    as _i643;
import 'register_module.dart' as _i291;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => registerModule.getsheredpref(),
    preResolve: true,
  );
  gh.singleton<_i361.Dio>(() => registerModule.dio);
  gh.singleton<_i390.AuthRemoteDataSource>(
      () => _i632.AuthApiRemoteDataSource(gh<_i361.Dio>()));
  gh.singleton<_i841.AuthLocalDataSource>(
      () => _i490.AuthSharedDataSource(gh<_i460.SharedPreferences>()));
  gh.singleton<_i927.AuthRepository>(() => _i643.AuthRepositoryImpl(
        gh<_i390.AuthRemoteDataSource>(),
        gh<_i841.AuthLocalDataSource>(),
      ));
  gh.singleton<_i541.LoginUseCases>(
      () => _i541.LoginUseCases(gh<_i927.AuthRepository>()));
  gh.singleton<_i577.RegisterUseCases>(
      () => _i577.RegisterUseCases(gh<_i927.AuthRepository>()));
  gh.singleton<_i731.AuthCubit>(() => _i731.AuthCubit(
        gh<_i541.LoginUseCases>(),
        gh<_i577.RegisterUseCases>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i291.RegisterModule {}
