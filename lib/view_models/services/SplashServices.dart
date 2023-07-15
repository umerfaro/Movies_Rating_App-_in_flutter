import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

import '../../Models/User_Model.dart';
import '../../utils/routes/Routes_name.dart';
import '../User_view_model.dart';

class SplashServices
{

  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async
  {
    getUserData().then((value) async {
      print(value.token.toString());

      if (value.token.toString() == 'null' || value.token.toString() == '') {
        await Future.delayed(const Duration(seconds: 2));
        Navigator.pushNamed(context, RouteNames.login);
      } else {
        await Future.delayed(const Duration(seconds: 2));
        Navigator.pushNamed(context, RouteNames.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
