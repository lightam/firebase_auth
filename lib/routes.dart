import 'package:flutter/material.dart';
import 'package:firebase/ui/home_page.dart';
import 'package:firebase/ui/login_page.dart';
import 'package:firebase/bloc/login_page_bloc.dart';
import 'package:firebase/bloc/main/bloc_provider.dart';


class Routes {

  var routes = <String, WidgetBuilder>{
    "/LoginPage": (BuildContext context) => new LoginPage(),
    "/HomePage": (BuildContext context) => new HomePage()
  };

  Routes() {
    runApp(new MaterialApp(
      title: "Hireshark",
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<LoginPageBloc>(
        bloc: LoginPageBloc(),
        child: LoginPage(),
      ),
      routes: routes,
    ));
  }
}