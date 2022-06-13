import 'package:flutter/material.dart';
import 'package:flutter_appcare/configs/api.dart';

TextEditingController controller1 = TextEditingController();
TextEditingController controller2 = TextEditingController();
TextEditingController controller3 = TextEditingController();
String? dropdownValue;
List<DropdownMenuItem<String>>? items = [
  const DropdownMenuItem(
    value: 'นาย',
    child: Text(
      'นาย',
    ),
  ),
  const DropdownMenuItem(
    value: 'นาง',
    child: Text(
      'นาง',
    ),
  ),
  const DropdownMenuItem(
    value: 'นางสาว',
    child: Text(
      'นางสาว',
    ),
  ),
];
Future openDialog(String title, String name, String surname, context) =>
    showDialog(
        context: context,
        builder: (context) => Container(
              width: double.infinity,
              height: 50,
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: AlertDialog(
                title: const Text('Enter Your Edit'),
                content: Column(
                  children: [
                    TextField(
                      controller: controller1,
                      decoration: InputDecoration(hintText: title),
                    ),
                    TextField(
                      controller: controller2,
                      decoration: InputDecoration(hintText: name),
                    ),
                    TextField(
                      controller: controller3,
                      decoration: InputDecoration(hintText: surname),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        submit(context);
                      },
                      child: const Text('Submit'))
                ],
              ),
            ));

void submit(context) {
  sendDataProfile1(
      controller1.text, controller2.text, controller3.text, context);
  Navigator.of(context).pop();
}

Future openDialogName(context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enter Your Edit'),
        content: SizedBox(
          width: double.infinity,
          height: 280,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButtonFormField<String>(
                value: dropdownValue,
                items: items,
                onChanged: (value) {
                  dropdownValue = value;
                },
              ),
              const SizedBox(height: 30),
              TextFormField(),
              const SizedBox(height: 30),
              TextFormField()
            ],
          ),
        ),
        actions: [
          TextButton(
              child: const Text('Submit'),
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
      ),
    );
