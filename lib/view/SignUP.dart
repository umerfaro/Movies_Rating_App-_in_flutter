import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resources/Color.dart';
import '../resources/Components/Round_button.dart';
import '../utils/routes/Routes_name.dart';
import '../utils/utlis.dart';
import '../view_models/Auth_View_Model.dart';

class SignUPView extends StatefulWidget {
  const SignUPView({super.key});

  @override
  State<SignUPView> createState() => _SignUPViewState();
}

class _SignUPViewState extends State<SignUPView> {
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  FocusNode namefocus = FocusNode();
  FocusNode passwordfocus = FocusNode();

  // after using above code we have to dispose the controller
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _namecontroller.dispose();
    _passwordcontroller.dispose();
    namefocus.dispose();
    passwordfocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    print("built");
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            centerTitle: true,
            backgroundColor: AppColors.AppBarColor,
            title:  Text("Register"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  onSubmitted: (val) {
                    Utils.FieldFocusChange(context, namefocus, passwordfocus);
                  },
                  keyboardType: TextInputType.name,
                  keyboardAppearance: Brightness.dark,
                  controller: _namecontroller,
                  decoration: InputDecoration(
                      labelText: "Name",
                      prefix: Icon(Icons.person_2_outlined,
                          color: Colors.purple.shade200),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: " Enter your name"),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.02,
                ),
                Consumer<AuthModel>(builder: (context, value, child) {
                  return TextField(
                    focusNode: passwordfocus,
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwordcontroller,
                    obscureText: value.gettoogle,
                    decoration: InputDecoration(
                        labelText: "Password",
                        prefix: Icon(Icons.lock_outline,
                            color: Colors.purple.shade200),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),

                          //  gapPadding: 10,
                        ),
                        hintText: "Enter your password",
                        suffix: InkWell(
                            onTap: () {
                              value.changetoogle();
                            },
                            child: Icon(value.gettoogle
                                ? Icons.visibility_off_outlined
                                : Icons.remove_red_eye))),
                  );
                }),
                SizedBox(
                  height: height * 0.1,
                ),
                Consumer<AuthModel>(builder: (context, value, child) {
                  return RoundButton(
                    text: 'Register',
                    loading: value.getsignuploading,
                    onPressed: () {
                      if (_namecontroller.text.isEmpty) {
                        Utils.flushBarErrorMessage(
                            "Please Enter Username", context);
                      } else if (_passwordcontroller.text.isEmpty) {
                        Utils.flushBarErrorMessage(
                            "Please Enter password", context);
                      } else if (_passwordcontroller.text.length < 6) {
                        Utils.flushBarErrorMessage(
                            "Please Enter 6 digit password", context);
                      } else {
                        Map data = {
                          "email": _namecontroller.text.toString(),
                          "password": _passwordcontroller.text.toString(),
                        };
                        value.SignUPApi(data, context);
                      }
                    },
                  );
                }),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RouteNames.login);
                        },
                        child: Text("Login"))
                  ],
                )

              ],
            ),
          )),
    );
  }
}
