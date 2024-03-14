import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// LOCALS ////////////
const String TOKEN = "token";
const String EMAIL = "email";
const String PASSWORD = "password";
const String IS_REMEMBER = "is-remember";

/// METHODS  
myHeaders() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString(TOKEN) ?? '';

  debugPrint("TOKEN FROM HEADERS: $token");

  return {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
}

// Headers without authorization
myFreeHeaders() {
  return {
    'Content-Type': 'application/json',
  };
}
