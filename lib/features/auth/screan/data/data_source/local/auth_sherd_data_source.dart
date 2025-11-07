import 'package:ecommerce/core/constant.dart';
import 'package:ecommerce/core/errors/api_exception.dart';
import 'package:ecommerce/features/auth/screan/data/data_source/local/auth_local_data_source.dart';
import 'package:ecommerce/features/auth/screens/data/data_source/local/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: AuthLocalDataSource)
class AuthSharedDataSource implements AuthLocalDataSource {
  final SharedPreferences sharedPrefs;

  AuthSharedDataSource(this.sharedPrefs);

  @override
  Future<void> saveToken(String token) async {
    try {
      await sharedPrefs.setString(CachConstants.tokenKey, token);
    } catch (_) {
      throw const localExcption('Failed to save token');
    }
  }

  @override
  Future<String?> getToken() async {
    try {
      return sharedPrefs.getString(CachConstants.tokenKey);
    } catch (_) {
      throw const localExcption('Failed to get token');
    }
  }
}
