import 'package:shared_preferences/shared_preferences.dart';

class CredentialsStorage {
  static const _emailKey = 'saved_email';
  static const _passwordKey = 'saved_password';

  
  static Future<void> saveCredentials(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_emailKey, email);
    await prefs.setString(_passwordKey, password);
  }

  /// Clears saved credentials.
  static Future<void> clearCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_emailKey);
    await prefs.remove(_passwordKey);
  }

  /// Returns a pair (email, password) or null if not set.
  static Future<Map<String, String>?> getSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString(_emailKey);
    final password = prefs.getString(_passwordKey);
    if (email == null || password == null) return null;
    return {'email': email, 'password': password};
  }
}
