import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:udemy_flutter/models/Otpss/OTP_model.dart';

import '../../../shared/dio_helper.dart';
import '../../../shared/end_points.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());
  static OtpCubit get(context) => BlocProvider.of(context);

  OtpModel model;
  void userOtpCheak({
    @required String otp,
    //@required String id,
  }) {
    emit(Otploading());

    DioHelper.postData(
      url: CHEAKOTP,
      data: {
        'otp': otp,
        //'id': id,
      },
    ).then((value) {
      model = OtpModel.fromJson(value.data);
      print(model.status);
      print(model.message);
      //print(model.data.token);
      print(value.data);

      emit(Otpsuccess(model));
    }).catchError((error) {
      emit(Otperror(error.toString()));
      print(error.toString());
    });
  }

  void userOtpDestroy({
    @required String id,
  }) {
    emit(Otploading());
    DioHelper.postData(url: destroyOTP, data: {'id': id}).then((value) {
      model = OtpModel.fromJson(value.data);
      print(model.status);
      print(model.message);
      //print(model.data.token);
      print(value.data);

      emit(Otpsuccess(model));
    }).catchError((error) {
      emit(Otperror(error.toString()));
      print(error.toString());
    });
  }
}
