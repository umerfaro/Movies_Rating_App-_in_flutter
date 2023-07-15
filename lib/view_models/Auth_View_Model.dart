import 'package:flutter/foundation.dart';
import 'package:mvvm_architechture/utils/routes/Routes_name.dart';
import 'package:provider/provider.dart';
import '../Models/User_Model.dart';
import '../respository/Auth_repository.dart';
import '../utils/utlis.dart';
import 'package:flutter/material.dart';

import 'User_view_model.dart';

class AuthModel with ChangeNotifier{

  bool _isloading = false;
  get getisloading => _isloading;


  void changeisloading(bool value)
  {
    _isloading = value;
    notifyListeners();
  }

  bool _signuploading = false;
  get getsignuploading => _signuploading;

  void Signuploadingchnage(bool value)
  {
    _signuploading = value;
    notifyListeners();
  }



  final _myRepo = AuthRepository();

  Future<void> LoginApi(dynamic data, BuildContext context) async {


    changeisloading(true);
    _myRepo.LoginAPI(data).then((value)
    {
      changeisloading(false);
      final userPreferences = Provider.of<UserViewModel>(context,listen: false);
      userPreferences.saveUser(
          UserModel(
            token: value['token'].toString(),
          )
      );
      Utils.flushBarErrorMessage("Successful", context);
      Navigator.pushNamed(context, RouteNames.home);
      if (kDebugMode) {
        print(value);
      }
    }).catchError((e) {
      changeisloading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(e.toString(), context);
        print(e);
      }
    });
  }



  Future<void> SignUPApi(dynamic data, BuildContext context) async {
    Signuploadingchnage(true);
    _myRepo.registerAPI(data).then((value)
    {
      Signuploadingchnage(false);
      Utils.flushBarErrorMessage("Successful", context);
      if (kDebugMode) {
        print(value);
      }
    }).catchError((e) {
      Signuploadingchnage(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(e.toString(), context);
        print(e);
      }
    });
  }

  bool _toogle = true;
  get gettoogle => _toogle;

  void changetoogle() {
    _toogle = !_toogle;
    notifyListeners();
  }

}
