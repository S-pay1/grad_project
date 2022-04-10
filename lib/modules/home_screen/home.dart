// ignore_for_file: missing_required_param

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/models/Service/elecrtic.dart';
import 'package:udemy_flutter/models/Service/gas.dart';
import 'package:udemy_flutter/models/Service/landing.dart';
import 'package:udemy_flutter/models/Service/phone.dart';
import 'package:udemy_flutter/models/Service/water.dart';
import 'package:udemy_flutter/models/Service/wifi.dart';
import 'package:udemy_flutter/models/choose%20type%20of%20user/ChooseTypeOfUser.dart';
import 'package:udemy_flutter/modules/cubit/homecubit_cubit.dart';
import 'package:udemy_flutter/modules/cubit/homecubit_state.dart';
import 'dart:ui';

import 'package:udemy_flutter/shared/components/components.dart';

import '../../models/Service/service.dart';
import '../../models/payment/about_us.dart';
import '../../models/payment/contact_us.dart';

class home extends StatelessWidget {
  // var phoneController = TextEditingController();
  // var passwordController = TextEditingController();
  // var emailController = TextEditingController();
  // var nameController = TextEditingController();
  // final phonerRegx = phoneNumberValidator;
  // final emailregex = EmailValidator;
  // final FullRegex = FullNameValidator;
  final _formKey = GlobalKey<FormState>();
  bool ispassword = true;
  bool value = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => HomecubitCubit(),
      child: BlocConsumer<HomecubitCubit, HomecubitState>(
        listener: (context, state) {
          // if (state is Registersuccess) {
          //   if (state.model.status) {
          //     print(state.model.message);
          //     Navigator.pushReplacement(
          //         context, MaterialPageRoute(builder: (context) => Otp()));
          //   } else {
          //     print(state.model.message);
          //   }
          // }
        },
        builder: (context, state) {
          return Stack(children: [
            Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/pics1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Scaffold(
              drawer: Drawer(
                child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        //color: const Color(0xff003B75),
                        image: DecorationImage(
                            image: AssetImage('assets/images/intro.jpeg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      leading: Icon(Icons.personal_injury_outlined),
                      title: Text("Account"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.chat),
                      title: Text("About us"),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => About_us()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.contacts),
                      title: Text("Contact Us"),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Contact_us()));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text("logout"),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TypeOfUser()));
                      },
                    ),
                  ],
                ),
              ),
              extendBodyBehindAppBar: true,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),
                centerTitle: false,
                title: Text(
                  'S-PAY',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 190,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Service_Screen()));
                              },
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/image (8).png'),
                                      height: size.height * 0.10,
                                      width: size.width * 0.14,
                                      //height: 100,
                                      //width: 100,
                                    ),
                                    Text(
                                      'gaz',
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.white),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 3),
                                  borderRadius: BorderRadius.circular(
                                    15.0,
                                  ),
                                ),
                                height: 140,
                                width: 110,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Service_Screen()));
                              },
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/image (11).png'),
                                      height: size.height * 0.10,
                                      width: size.width * 0.20,
                                      //height: 100,
                                      //width: 100,
                                    ),
                                    Text(
                                      'water',
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.white),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 3),
                                  borderRadius: BorderRadius.circular(
                                    15.0,
                                  ),
                                ),
                                height: 140,
                                width: 140,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Electronic()));
                              },
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/image (7).png'),
                                      height: size.height * 0.10,
                                      width: size.width * 0.20,
                                      //height: 100,
                                      //width: 100,
                                    ),
                                    Text(
                                      'Electric',
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.white),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 3),
                                  borderRadius: BorderRadius.circular(
                                    15.0,
                                  ),
                                ),
                                height: 140,
                                width: 140,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Phone()));
                              },
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/image (12).png'),
                                      height: size.height * 0.10,
                                      width: size.width * 0.20,
                                      //height: 100,
                                      //width: 100,
                                    ),
                                    Text(
                                      'Phone',
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.white),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 3),
                                  borderRadius: BorderRadius.circular(
                                    15.0,
                                  ),
                                ),
                                height: 140,
                                width: 140,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Landing()));
                              },
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/image (10).png'),
                                      height: size.height * 0.11,
                                      width: size.width * 0.11,
                                      //height: 100,
                                      //width: 100,
                                    ),
                                    Text(
                                      'Landing',
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.white),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 3),
                                  borderRadius: BorderRadius.circular(
                                    15.0,
                                  ),
                                ),
                                height: 140,
                                width: 140,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Wifi()));
                              },
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/image (9).png'),
                                      height: size.height * 0.10,
                                      width: size.width * 0.10,
                                      //height: 100,
                                      //width: 100,
                                    ),
                                    Text(
                                      'Wifi',
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.white),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 3),
                                  borderRadius: BorderRadius.circular(
                                    15.0,
                                  ),
                                ),
                                height: 140,
                                width: 70,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Service_Screen()));
                          },
                          child: Text(
                            'Other Service',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }
}
