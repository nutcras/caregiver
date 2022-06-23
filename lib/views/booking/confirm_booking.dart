import 'package:flutter/material.dart';

import '../../configs/api.dart';

class ConfirmBook extends StatefulWidget {
  ConfirmBook(
    this.data,
    this.pictime,
    this.picdate,
    this.pictime2,
    this.picdate2,
    this.ratePhr, {
    Key? key,
  }) : super(key: key);
  dynamic data, pictime, picdate, pictime2, picdate2, ratePhr;

  @override
  State<ConfirmBook> createState() => _ConfirmBookState();
}

class _ConfirmBookState extends State<ConfirmBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('สรุปการจอง')),
      body: SizedBox(
          child: Column(
        children: [
          Text(widget.data['fname'] + '  ' + widget.data['lname']),
          Text(widget.picdate + '  ' + widget.pictime),
          Text(widget.picdate2 + '  ' + widget.pictime2),
          Text('ยอดทั้งหมด  :   ' + widget.ratePhr.toString()),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: (() {
              sendtimebook(widget.data['idm'], widget.pictime, widget.picdate,
                  widget.pictime2, widget.picdate2, widget.ratePhr, context);
            }),
            child: const Text('ยืนยันการจอง'),
          )
        ],
      )),
    );
  }
}
