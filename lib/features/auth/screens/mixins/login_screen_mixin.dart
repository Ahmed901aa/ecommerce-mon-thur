import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/utils/credentials_storage.dart';

/// Mixin for login screen state management.
/// Provides functionality for loading saved credentials, managing auth errors,
/// and disposing resources.
/// 
/// The state class must provide:
/// - emailController: TextEditingController
/// - passwordController: TextEditingController
/// - authError: String? (getter/setter)
/// - errorTimer: Timer? (getter/setter)
mixin LoginScreenMixin<T extends StatefulWidget> on State<T> {
  // These must be defined in the state class
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  String? authError;
  Timer? errorTimer;

  /// Initialize login screen - loads saved credentials
  void initLoginScreen() {
    _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    final creds = await CredentialsStorage.getSavedCredentials();
    if (creds != null) {
      emailController.text = creds['email']!;
      passwordController.text = creds['password']!;
    }
  }

  /// Set auth error message with auto-clear after 10 seconds
  void setAuthError(String? message) {
    // Cancel any existing timer.
    errorTimer?.cancel();
    if (message == null) {
      setState(() => authError = null);
      return;
    }
    setState(() => authError = message);
    // Auto-clear after 10 seconds.
    errorTimer = Timer(const Duration(seconds: 10), () {
      if (mounted) setState(() => authError = null);
    });
  }

  /// Dispose login screen resources
  void disposeLoginScreen() {
    emailController.dispose();
    passwordController.dispose();
    errorTimer?.cancel();
  }
}
