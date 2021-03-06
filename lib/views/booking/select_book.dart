import 'package:flutter/material.dart';
import '../../configs/api.dart';
import 'package:intl/intl.dart';

class SelectBooking extends StatefulWidget {
  const SelectBooking({Key? key, required this.data}) : super(key: key);
  final dynamic data;
  @override
  State<SelectBooking> createState() => _SelectBookingState();
}

class _SelectBookingState extends State<SelectBooking> {
  TextEditingController picdate = TextEditingController();
  TextEditingController pictime = TextEditingController();
  TextEditingController picdate2 = TextEditingController();
  TextEditingController pictime2 = TextEditingController();
  DateTime? selectdate, selectdate2;
  TimeOfDay? selecttime, selecttime2;
  DateTime? datenow = DateTime.now();
  late DateTime datecal, datecal2;
  var ratePhr;

  @override
  Widget build(BuildContext context) {
    void newDate() async {
      selectdate = await showDatePicker(
          context: context,
          initialDate: datenow!,
          firstDate: DateTime(DateTime.now().year, DateTime.now().month, 1),
          lastDate: DateTime(DateTime.now().year, DateTime.now().month, 30));
      if (selectdate != null) {
        setState(() {
          datenow = selectdate;
          picdate.text = DateFormat("yyyy-MM-dd").format(selectdate!);
          DateFormat("yyyy-MM-dd").format(selectdate!);
        });
      }
    }

    void newTime() async {
      selecttime =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      if (selecttime != null) {
        setState(() {
          // datenow = date;
          pictime.text = '${selecttime!.hour}:${selecttime?.minute}';
          // DateFormat("dd/MM/yyyy").format(date);
        });
      }
    }

    void newDate2() async {
      selectdate2 = await showDatePicker(
          context: context,
          initialDate: datenow!,
          firstDate: DateTime(DateTime.now().year, DateTime.now().month, 1),
          lastDate: DateTime(DateTime.now().year, DateTime.now().month, 30));
      if (selectdate2 != null) {
        setState(() {
          datenow = selectdate2;
          picdate2.text = DateFormat("yyyy-MM-dd").format(selectdate2!);
          DateFormat("yyyy-MM-dd").format(selectdate2!);
        });
      }
    }

    void newTime2() async {
      selecttime2 =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      if (selecttime2 != null) {
        setState(() {
          // datenow = date;
          pictime2.text = '${selecttime2!.hour}:${selecttime2?.minute}';
          // DateFormat("dd/MM/yyyy").format(date);
        });
      }
    }

    calculator(rate) {
      final result, convert;
      DateTime? date1 = DateTime(selectdate!.year, selectdate!.month,
          selectdate!.day, selecttime!.hour, selecttime!.minute);
      DateTime? date2 = DateTime(selectdate2!.year, selectdate2!.month,
          selectdate2!.day, selecttime2!.hour, selecttime2!.minute);
      final difference = date2.difference(date1);
      return result = (difference.inHours +
              (difference.inMinutes - (difference.inHours * 60)) *
                  0.016666666666667) *
          rate;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('SelectBooking'),
        backgroundColor: const Color.fromARGB(255, 45, 134, 156),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: picdate,
                  readOnly: true,
                  onTap: () {
                    newDate();
                  },
                  decoration: const InputDecoration(
                    labelText: '??????????????????',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 23, 142, 239),
                            width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: pictime,
                  readOnly: true,
                  onTap: () {
                    newTime();
                  },
                  decoration: const InputDecoration(
                    labelText: '????????????',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 23, 142, 239),
                            width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: picdate2,
                  readOnly: true,
                  onTap: () {
                    newDate2();
                  },
                  decoration: const InputDecoration(
                    labelText: '??????????????????',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 23, 142, 239),
                            width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: pictime2,
                  readOnly: true,
                  onTap: () {
                    newTime2();
                  },
                  decoration: const InputDecoration(
                    labelText: '????????????',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 23, 142, 239),
                            width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: (() {
                    ratePhr = calculator(widget.data['men_rate']);
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: const Text('????????????????????????????????????????????????'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(widget.data['men_fname'] +
                                      '  ' +
                                      widget.data['men_lname']),
                                  Text(picdate.text + '  ' + pictime.text),
                                  Text(picdate2.text + '  ' + pictime2.text),
                                  Text('??????????????????????????????  : ' +
                                      ratePhr.toStringAsFixed(2)),
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: (() {
                                      sendtimebook(
                                          widget.data['men_id'],
                                          pictime.text,
                                          picdate.text,
                                          pictime2.text,
                                          picdate2.text,
                                          ratePhr,
                                          context);
                                    }),
                                    child: const Text('????????????????????????????????????'),
                                  )
                                ],
                              ),
                            ));
                  }),
                  child: const Text('????????????????????????????????????'),
                )
              ],
            )),
      ),
    );
  }
}
