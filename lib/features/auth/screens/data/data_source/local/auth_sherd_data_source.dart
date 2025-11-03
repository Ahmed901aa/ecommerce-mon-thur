import 'package:ecommerce/core/constant.dart';
import 'package:ecommerce/core/errors/api_exception.dart';
import 'package:ecommerce/features/auth/screens/data/data_source/local/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSharedDataSource extends AuthLocalDataSource {
  
  @override
  Future<void> saveToken(String token) async {
    try{ final prefs = await SharedPreferences.getInstance();
    await prefs.setString(CachConstants.tokenKey, token);}
    catch (_ ){
      throw const localExcption('Failed to save token');


    }
  }

  @override
  Future<String?> getToken() async {
   try { final prefs = await SharedPreferences.getInstance();
    return prefs.getString(CachConstants.tokenKey);} 
    catch(_){
      throw const localExcption('Faleid to get tokn');
    }
  }
}
