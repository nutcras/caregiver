import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../configs/api.dart';
import 'package:flutter_appcare/models/text_model.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _Register();
}

class _Register extends State<PageOne> {
  final _formkey = GlobalKey<FormState>();
  bool hidepassword = true;
  bool hidepassword1 = true;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController conpassword = TextEditingController();
  TextEditingController picdate = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();

  DateTime? datenow = DateTime.now();
  @override
  Widget build(BuildContext context) {
    // void newDate() async {
    //   DateTime? date = await showDatePicker(
    //       context: context,
    //       initialDate: datenow!,
    //       firstDate: DateTime(DateTime.now().year - 70),
    //       lastDate: DateTime(DateTime.now().year, DateTime.now().day));

    //   if (date != null) {
    //     setState(() {
    //       datenow = date;
    //       picdate.text = DateFormat("yyyy-MM-dd").format(date);
    //     });
    //   }
    // }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 63, 217, 255),
      body: SingleChildScrollView(
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
              TextFormField(
                  controller: password,
                  obscureText: hidepassword,
                  decoration: InputDecoration(
                      labelText: 'password',
                      hintText: 'password',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255)),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      suffixIcon: IconButton(
                          onPressed: (() {
                            setState(() {
                              hidepassword = !hidepassword;
                            });
                          }),
                          icon: Icon(
                            hidepassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 30,
                            color: Colors.white,
                          )))),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                  controller: conpassword,
                  obscureText: hidepassword1,
                  decoration: InputDecoration(
                      labelText: 'confirm password',
                      hintText: 'confirm password',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255)),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255)),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      suffixIcon: IconButton(
                          onPressed: (() {
                            setState(() {
                              hidepassword1 = !hidepassword1;
                            });
                          }),
                          icon: Icon(
                            hidepassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 30,
                            color: Colors.white,
                          )))),
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
              TextFormField(
                controller: picdate,
                readOnly: true,
                onTap: () {
                  // newDate();
                },
                decoration: const InputDecoration(
                  labelText: 'birthday',
                  labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0), width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 23, 142, 239), width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                ),
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

                  await checkRegister(username.text, password.text, name.text,
                      surname.text, "2020-06-05", context);
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
    );
  }
}
