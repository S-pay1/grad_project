// ignore_for_file: missing_required_param

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/models/payment/Otp.dart';
import 'package:udemy_flutter/modules/user/user/signup/cubit/register_cubit.dart';
import 'package:udemy_flutter/shared/components/components.dart';

import '../../../../models/layout/home/homePageLayout.dart';

import '../../../../shared/rejex.dart';
import '../login/login_screen.dart';

class SignUp extends StatelessWidget {
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool ispassword = true;
  bool value = false;
  final rejexfullname = fullNameValidator;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is Registersuccess) {
            if (state.model.status) {
              print(state.model.message);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Homelayout()));
            } else {
              print(state.model.message);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),
              title: Text(
                'SignUp ',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage("assets/images/20943394.jpg"),
                        height: 250.0,
                        width: 250.0,
                      ),
                      defaultFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          label: 'Full Name',
                          prefix: Icons.drive_file_rename_outline,
                          validate: rejexfullname),
                      SizedBox(
                        height: 20,
                      ),
                      defaultFormField(
                          controller: phoneController,
                          type: TextInputType.number,
                          label: 'Phone',
                          prefix: Icons.phone,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Please Enter Your Password';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      /*defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          label: 'emil',
                          prefix: Icons.email,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Please Enter Your Password';
                            }
                            return null;
                          }),*/
                      SizedBox(
                        height: 20,
                      ),
                      defaultFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        suffix: RegisterCubit.get(context).suffix,
                        onSubmit: (value) {
                          if (_formKey.currentState.validate()) {
                            RegisterCubit.get(context).userRegister(
                              name: nameController.text,
                              phone: phoneController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                        isPassword: RegisterCubit.get(context).isPassword,
                        suffixPressed: () {
                          RegisterCubit.get(context).changePasswordVisibility();
                        },
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'password is too short';
                          }
                        },
                        label: 'Password',
                        prefix: Icons.lock_outline,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      ConditionalBuilder(
                        condition: state is! Registerloading,
                        builder: (context) => defaultButton(
                            text: 'sign up',
                            function: () {
                              if (_formKey.currentState.validate()) {
                                RegisterCubit.get(context).userRegister(
                                  password: passwordController.text,
                                  name: nameController.text,
                                  phone: phoneController.text,
                                );
                              }
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Otp()));
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'already have an account?',
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
