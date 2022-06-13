import 'package:flutter/material.dart';
import '../../configs/api.dart';
import 'package:flutter_appcare/models/textFormFieldModel.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _Register();
}

class _Register extends State<PageOne> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController conpassword = TextEditingController();
  TextEditingController picdate = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();

  DateTime? datenow = DateTime.now();
  @override
  Widget build(BuildContext context) {
    void newDate() async {
      DateTime? date = await showDatePicker(
          context: context,
          initialDate: datenow!,
          firstDate: DateTime(DateTime.now().year - 70),
          lastDate: DateTime(DateTime.now().year, DateTime.now().day));

      if (date != null) {
        setState(() {
          datenow = date;
        });
      }
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 63, 217, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Register',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldModel(
                  controller: username,
                  labelText: 'username',
                  hintText: 'username',
                  textError: 'Pleas key value',
                  helperText: 'Type you Usename for display',
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldModel(
                  controller: password,
                  labelText: 'password',
                  hintText: 'password',
                  textError: 'Pleae Key value',
                  helperText: 'Type you password more 6 Charactor ',
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldModel(
                  controller: conpassword,
                  labelText: 'Confirm Password',
                  hintText: 'Confirm Passwod',
                  textError: 'Confirm Password More 6 Charactor',
                  helperText: 'Type confirm password for display',
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldModel(
                  controller: name,
                  labelText: 'name',
                  hintText: 'name',
                  textError: 'Please fill you name in the blank',
                  helperText: 'Type you name for display',
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldModel(
                  controller: surname,
                  labelText: 'surname',
                  hintText: 'surname',
                  textError: 'Please fill you surname in the blank',
                  helperText: 'Type you surname for display',
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState?.save();
                    }
                    print('สมัครสมาชิก');

                    await checkRegister(username.text, password.text, name.text,
                        surname.text, context);
                  },
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                        color: Color.fromARGB(255, 45, 134, 156),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    primary: Color.fromARGB(255, 255, 255, 255),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
