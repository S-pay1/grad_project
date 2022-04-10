// ignore_for_file: unused_import, unnecessary_import

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:udemy_flutter/models/user/user/login/login_model.dart';
import 'package:udemy_flutter/shared/dio_helper.dart';
import 'package:udemy_flutter/shared/end_points.dart';

import '../history_screen/history.dart';
import '../home_screen/home.dart';
import '../wallet_screen/wallet.dart';
import 'homecubit_state.dart';

class HomecubitCubit extends Cubit<HomecubitState> {
  HomecubitCubit() : super(HomecubitInitial());

  static HomecubitCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  int i = 0;

  List<Widget> screens = [
    home(),
    Wallet(),
    History(),
  ];
  List<String> titles = [
    'home',
    'wallet',
    'History',
  ];

  List<String> ChosseService = [
    'gas',
    'water',
    'electric',
    'phone',
    'landing',
    'wifi',
  ];
  List<String> Servicecode = [
    'code',
    'code',
    'code',
    'phonenumber',
    'landing number',
    'number',
  ];
  List<String> ServicCompany = [
    'code',
    'code',
    'code',
    'phonenumber',
    'landing number',
    'number',
  ];
  void changeindex(int index) {
    currentIndex = index;
    emit(HomecubitBottomNav());
  }

  // void changeindexscreen(int index) {
  //   currentIndex = index;
  //     emit(HomecubitService());

  // }
  void changeindexscreen(int index) {
    currentIndex = index;

    emit(HomecubitService());
  }
}
