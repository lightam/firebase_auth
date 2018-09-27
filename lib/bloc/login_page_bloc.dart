import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:firebase/bloc/main/bloc_provider.dart';
import 'package:firebase/services/authentication.dart';


class LoginPageBloc implements BlocBase {
  UserData user = new UserData();
  UserAuth userAuth = new UserAuth();

  void fillUser(UserData user){
    user.email="test@gmail.de";
    user.displayName="Ado";
    user.password="test1234";
  }

  //
  // Stream to handle the counter
  //
  StreamController<int> _counterController = StreamController<int>();
  Stream<int> get outCounter => _counterController.stream;

  //
  // Stream to handle the action on the counter
  //
  StreamController _loginButtonController = StreamController();
  StreamSink get login => _loginButtonController.sink;

  //
  // Constructor
  //
  LoginPageBloc(){
    fillUser(user);
    _loginButtonController.stream
        .listen(_loginAction);
  }

  void dispose(){
    _loginButtonController.close();
    _counterController.close();
  }

  void _loginAction(data){
    userAuth.verifyUser(user).then((onValue) {
      if (onValue == "Login Successfull")
        Navigator.pushNamed(data, "/HomePage");
      else
        print("Login not working: $onValue");
    });
  }
}