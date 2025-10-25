import 'package:ecommerce/core/constant.dart';
import 'package:ecommerce/features/auth/screens/data/data_source/local/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSharedDataSource extends AuthLocalDataSource {
  
  @override
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(CachConstants.tokenKey, token);
  }

  @override
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(CachConstants.tokenKey);
  }
}
