// ignore_for_file: unused_label, unused_import, duplicate_ignore, deprecated_member_use

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:udemy_flutter/models/layout/intro.dart';
import 'package:udemy_flutter/shared/bloc_observer.dart';

import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/dio_helper.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';

import 'models/Service/service.dart';

import 'models/company/company/CompanyLogin.dart';
import 'models/company/company/CompanySignUp.dart';
import 'models/company/company/companyRecipts.dart';
import 'models/company/company/termsAndPoliceis.dart';
import 'models/layout/home/homePageLayout.dart';
import 'models/layout/test.dart';
import 'models/payment/Otp.dart';
import 'models/payment/Payment.dart';
import 'models/payment/about_us.dart';
import 'models/payment/account.dart';
import 'models/payment/contact_us.dart';
import 'models/payment/pay_with_wallet.dart';

// import 'models/user/user/signup/Signup.dart';
// import 'models/user/user/login/login_screen.dart';
// import 'models/user/user/reset password/NewPassword.dart';
// import 'models/user/user/reset password/RsetPasswprd.dart';
// import 'models/user/user/termsuser.dart';
import 'modules/user/user/signup/Signup.dart';
import 'shared/styles/styles.dart';

Future<void> main() {
  //BlocObserver:MyBlocObserver();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.light,
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              foregroundColor: Color(0xff004B7d))),
      home: Homelayout(),
    );
  }
}
