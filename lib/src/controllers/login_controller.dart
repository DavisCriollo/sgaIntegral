
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
   GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
    


 bool validateForm() {
    if (loginFormKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }


  String? _usuario = "", _clave = "";
  void onChangeUser(String text) {
    _usuario = text;
  }

  void onChangeClave(String text) {
    _clave = text;
  }



}