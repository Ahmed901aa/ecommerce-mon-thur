import 'package:ecommerce/features/auth/presentation/auth_cubit.dart' as _i317;
import 'package:ecommerce/features/auth/screens/data/data_source/local/auth_local_data_source.dart'
    as _i60;
import 'package:ecommerce/features/auth/screens/data/data_source/local/auth_sherd_data_source.dart'
    as _i168;
import 'package:ecommerce/features/auth/screens/data/data_source/remote/auth_api_remote_data_source.dart'
    as _i781;
import 'package:ecommerce/features/auth/screens/data/data_source/remote/auth_remote_data_source.dart'
    as _i969;
import 'package:ecommerce/features/auth/screens/data/repositories/auth_repository.dart'
    as _i1048;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i317.AuthCubit>(() => _i317.AuthCubit());
    gh.singleton<_i60.AuthLocalDataSource>(() => _i168.AuthSharedDataSource());
    gh.singleton<_i969.AuthRemoteDataSource>(
        () => _i781.AuthApiRemoteDataSource());
    gh.singleton<_i1048.AuthRepository>(() => _i1048.AuthRepository(
          gh<_i969.AuthRemoteDataSource>(),
          gh<_i60.AuthLocalDataSource>(),
        ));
    return this;
  }
}
