// ignore_for_file: non_constant_identifier_names, unused_local_variable, unused_element

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:udemy_flutter/models/Service/service.dart';
import 'package:udemy_flutter/models/Service/service_model.dart';
import 'package:udemy_flutter/shared/dio_helper.dart';
import 'package:udemy_flutter/shared/end_points.dart';

part 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(ServiceInitial());
  static ServiceCubit get(context) => BlocProvider.of(context);
  int counterIndex;
  List<String> ChosseService = [
    'gas',
    'water',
    'electric',
    'phone',
    'landing',
    'wifi',
  ];
  List<String> Servicecode = [
    'Service code',
    'Service code',
    'Service code',
    'phone number',
    'landing number',
    'number',
  ];
  List<String> ServicCompany = [
    'company',
    'company',
    'company',
    'Network',
    'landing number',
    'number',
  ];
  int indexOfServices;

  void changeindexscreen(text) {
    Global.indexOfServices = ChosseService.indexOf(text);
    // Global.indexOfServices = Servicecode.indexOf(text);
    // Global.indexOfServices = ServicCompany.indexOf(text);
    print(Global.indexOfServices);
  }

  ServiceModel model;
  void userService({
    @required String client_id,
    @required String company_id,
    @required String price,
    @required String service_code,
  }) {
    emit(Serviceloading());
    DioHelper.postData(
      url: REIGSTERs,
      data: {
        'client_id': client_id,
        'company_id': company_id,
        'price': price,
        'service_code': service_code,
      },
    ).then((value) {
      model = ServiceModel.fromJson(value.data);
      print(model.status);
      print(model.message);
      //print(model.data.token);
      print(value.data);

      emit(Servicesuccess(model));
    }).catchError((error) {
      emit(Serviceerror(error.toString()));
      print(error.toString());
    });
  }
}
