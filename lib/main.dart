import 'package:flutter/material.dart';
import 'package:mvvm_architechture/view_models/Auth_View_Model.dart';
import 'package:mvvm_architechture/view_models/Auth_View_Model.dart';
import 'package:mvvm_architechture/utils/routes/Routes.dart';
import 'package:mvvm_architechture/utils/routes/Routes_name.dart';
import 'package:mvvm_architechture/view_models/Home_view_Model.dart';
import 'package:mvvm_architechture/view_models/User_view_model.dart';
import 'package:provider/provider.dart';

import 'view/Homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=> AuthModel()),
          ChangeNotifierProvider(create: (_)=> UserViewModel()),
          //ChangeNotifierProvider(create: (_)=> HomeviewViewModel()),
        ],

        child: Builder(builder: (BuildContext context){

          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: RouteNames.splash,
            onGenerateRoute: Routes.generateRoutes,
          );
        })

    );
  }
}
