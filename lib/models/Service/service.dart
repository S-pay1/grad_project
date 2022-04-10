// ignore_for_file: missing_required_param

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/modules/cubit/homecubit_cubit.dart';
import 'package:udemy_flutter/modules/cubit/homecubit_state.dart';
import 'package:udemy_flutter/shared/components/components.dart';

import '../layout/home/homePageLayout.dart';

class Service_Screen extends StatelessWidget {
  var num = TextEditingController();
  var text = TextEditingController();
  var number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomecubitCubit(),
      child: BlocConsumer<HomecubitCubit, HomecubitState>(
        listener: (BuildContext context, APPstate) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = HomecubitCubit.get(context);
          return Scaffold(
            appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Homelayout()));
                    },
                    icon: Icon(Icons.arrow_back)),
                title: Text(
                  cubit.ChosseService[HomecubitCubit.get(context).i],
                )),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  defaultFormField(
                    controller: num,
                    type: TextInputType.number,
                    /*validation: validation,*/ label:
                        cubit.Servicecode[HomecubitCubit.get(context).i],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  /* DropdownButton(
                    items: [
                      cubit.ServicCompany[
                          HomecubitCubit.get(context).currentIndex]
                    ]
                        .map((e) => DropdownMenuItem(
                              child: Text("$e"),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {},
                    value: 'ezz',
                  ),*/
                  defaultFormField(
                    controller: text,
                    type: TextInputType.text,
                    /*validation: validation,*/ label:
                        cubit.ServicCompany[HomecubitCubit.get(context).i],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  defaultFormField(
                    controller: number,
                    type: TextInputType.number,
                    /*validation: validation,*/ label: 'amount',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultButton(function: () {}, text: 'pay')
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
