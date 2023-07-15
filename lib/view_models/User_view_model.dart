
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/User_Model.dart';

class UserViewModel with ChangeNotifier{

  Future<bool> saveUser(UserModel user)async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    notifyListeners();
    return true ;
  }

  Future<UserModel> getUser()async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');

    return UserModel(
        token: token.toString()
    );
  }

  Future<bool> remove()async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;

  }
}

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// import '../Models/User_Model.dart';
//
// class UserViewModel with ChangeNotifier {
//
//   final FlutterSecureStorage _storage = FlutterSecureStorage();
//
//   Future<bool> saveUser(UserModel user) async {
//     await _storage.write(key: 'token', value: user.token.toString());
//     notifyListeners();
//     return true;
//   }
//
//   Future<UserModel> getUser() async {
//     final String? token = await _storage.read(key: 'token');
//     return UserModel(token: token.toString());
//   }
//
//   Future<bool> remove() async {
//     await _storage.delete(key: 'token');
//     return true;
//   }
// }
