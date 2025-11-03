part of 'service_loacator.dart';

extension GetItInjectableX on GetIt {
  GetIt init({
    String? environment,
    EnvironmentFilter? environmentFilter,
  }) {
    final gh = GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<Dio>(() {
      return Dio(BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
      ));
    });
    gh.singleton<AuthRemoteDataSource>(
        () => AuthApiRemoteDataSource(gh<Dio>()));
    gh.singleton<AuthLocalDataSource>(
        () => AuthSharedDataSource(gh<SharedPreferences>()));
    gh.singleton<AuthRepository>(() => AuthRepository(
          gh<AuthRemoteDataSource>(),
          gh<AuthLocalDataSource>(),
        ));
    gh.singleton<AuthCubit>(
        () => AuthCubit(gh<AuthRepository>()));
    return this;
  }
}
