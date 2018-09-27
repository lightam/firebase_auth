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
  // Stream to handle the loginButton
  //
  StreamController _normalLoginController = StreamController();
  StreamSink get inLoginButton => _normalLoginController.sink;

  //
  // Stream to handle the GoogleLogin
  //
  StreamController _googleLoginButtonController = StreamController();
  StreamSink get inGoogleLogin => _googleLoginButtonController.sink;

  //
  // Constructor
  //
  LoginPageBloc(){
    fillUser(user);
    _googleLoginButtonController.stream
        .listen(_googleLoginAction);
    _normalLoginController.stream
        .listen(_normalLoginAction);
  }

  void dispose(){
    _googleLoginButtonController.close();
    _normalLoginController.close();
  }

  void _normalLoginAction(data){
    print("Normal Login");
    Navigator.pushNamed(data, "/HomePage");
  }

  void _googleLoginAction(context){

    userAuth.verifyUser(user).then((onValue) {
      if (onValue == "Login Successfull")
        Navigator.pushNamed(context, "/HomePage");
      else
        print("Login not working: $onValue");
    });
  }
}