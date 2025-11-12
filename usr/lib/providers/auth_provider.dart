import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  String? _userEmail;
  String? _userName;
  static const String _authKey = 'is_authenticated';
  static const String _emailKey = 'user_email';
  static const String _nameKey = 'user_name';

  bool get isAuthenticated => _isAuthenticated;
  String? get userEmail => _userEmail;
  String? get userName => _userName;

  AuthProvider() {
    _loadAuthState();
  }

  Future<void> _loadAuthState() async {
    final prefs = await SharedPreferences.getInstance();
    _isAuthenticated = prefs.getBool(_authKey) ?? false;
    _userEmail = prefs.getString(_emailKey);
    _userName = prefs.getString(_nameKey);
    notifyListeners();
  }

  // Mock login with email/password
  Future<bool> login(String email, String password) async {
    // TODO: Integrate with Supabase authentication when connected
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    
    // Mock validation
    if (email.isNotEmpty && password.length >= 6) {
      _isAuthenticated = true;
      _userEmail = email;
      _userName = email.split('@')[0];
      
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_authKey, true);
      await prefs.setString(_emailKey, email);
      await prefs.setString(_nameKey, _userName!);
      
      notifyListeners();
      return true;
    }
    return false;
  }

  // Mock Google login
  Future<bool> loginWithGoogle() async {
    // TODO: Integrate with Supabase Google OAuth when connected
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    
    _isAuthenticated = true;
    _userEmail = 'user@gmail.com';
    _userName = 'Google User';
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_authKey, true);
    await prefs.setString(_emailKey, _userEmail!);
    await prefs.setString(_nameKey, _userName!);
    
    notifyListeners();
    return true;
  }

  // Mock signup
  Future<bool> signup(String email, String password) async {
    // TODO: Integrate with Supabase authentication when connected
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    
    if (email.isNotEmpty && password.length >= 6) {
      return await login(email, password);
    }
    return false;
  }

  // Logout
  Future<void> logout() async {
    _isAuthenticated = false;
    _userEmail = null;
    _userName = null;
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_authKey);
    await prefs.remove(_emailKey);
    await prefs.remove(_nameKey);
    
    notifyListeners();
  }

  // Mock password recovery
  Future<bool> recoverPassword(String email) async {
    // TODO: Integrate with Supabase password recovery when connected
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    return email.isNotEmpty;
  }
}
