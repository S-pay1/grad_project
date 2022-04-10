// ignore_for_file: missing_required_param

import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../layout/home/homePageLayout.dart';
import '../payment/Payment.dart';

class Electronic extends StatefulWidget {
  const Electronic({Key key}) : super(key: key);

  @override
  State<Electronic> createState() => _ElectronicState();
}

class _ElectronicState extends State<Electronic> {
  var num = TextEditingController();
  var text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Homelayout()));
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('Electonic'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            defaultFormField(
              controller: num,
              type: TextInputType.number,
              /*validation: validation,*/ label: 'code',
            ),
            SizedBox(
              height: 18,
            ),
            defaultFormField(
              controller: num,
              type: TextInputType.number,
              /*validation: validation,*/ label: 'company',
            ),
            SizedBox(
              height: 18,
            ),
            defaultFormField(
              controller: num,
              type: TextInputType.number,
              /*validation: validation,*/ label: 'amount',
            ),
            SizedBox(
              height: 20,
            ),
            defaultButton(
                function: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Payment()));
                },
                text: 'pay')
          ],
        ),
      ),
    );
  }
}