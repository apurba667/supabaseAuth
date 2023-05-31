import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final clint = Supabase.instance.client;

//custom SnackBar

extension ShowSnackBar on BuildContext {
  void showErrorMessage(String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
        content: Text(
      message,
      style: TextStyle(color: Colors.redAccent),
    ),backgroundColor: Colors.grey,));
  }
}
