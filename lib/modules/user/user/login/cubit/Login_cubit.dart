import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../shared/dio_helper.dart';
import '../../../../../shared/end_points.dart';
import '../../login/login_model.dart';

part 'Login_state.dart';

class loginCubit extends Cubit<loginState> {
  loginCubit() : super(loginInitial());
  static loginCubit get(context) => BlocProvider.of(context);

  LoginModel model;
  void userlogin({
    //@required String email,
    @required String phone,
    @required String password,
  }) {
    var pas = utf8.encode(password);
    var hashPassword = sha256.convert(pas);
    emit(loginloading());
    DioHelper.postData(
      url: LOGINs,
      data: {
        'phone': phone,
        'password': hashPassword.toString(),
      },
    ).then((value) {
      model = LoginModel.fromJson(value.data);
      print(model.status);
      print(model.message);
      //print(model.data.token);
      print(value.data);

      emit(loginsuccess(model));
    }).catchError((error) {
      emit(loginerror(error.toString()));
      print(error.toString());
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(loginpaswwordChange());
  }
}
