import 'package:flutter/material.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier{
  Future<bool> saveUser(UserModal user)async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("token", user.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserModal> getUser()async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString("token");

    return UserModal(
      token: token.toString()
    );
  }

  Future<bool> remove() async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove("token");
    return true;
  }
}