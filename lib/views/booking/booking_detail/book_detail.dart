import 'package:flutter/material.dart';
import 'package:flutter_appcare/configs/api.dart';
import 'package:intl/intl.dart';

class Bookdetail extends StatefulWidget {
  const Bookdetail({Key? key, required this.data}) : super(key: key);

  final dynamic data;
  @override
  State<Bookdetail> createState() => _BookdetailState();
}

class _BookdetailState extends State<Bookdetail> {
  get children => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ข้อมูลพี่เลี้ยง'),
        backgroundColor: const Color.fromARGB(255, 45, 134, 156),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Center(
              //รูปavatar
              child: CircleAvatar(
                radius: 70,
                // backgroundImage: ('${widget.data['image']}'),
                backgroundColor: Color.fromARGB(255, 45, 134, 156),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
                child: Column(children: [
              Text(
                'เริ่ม : ' +
                    DateFormat('dd-mm-yy' '  เวลา : HH:mm').format(
                        DateTime.parse('${widget.data['book_starttime']}')),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                'ถึง  :  ' +
                    DateFormat('dd-mm-yy  ' 'เวลา : HH:mm').format(
                        DateTime.parse('${widget.data['book_endtime']}')),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                'ยอดทั้งหมด :   ${widget.data['book_result']}  บาท',
                style: TextStyle(fontSize: 17),
              ),
            ])),
            const SizedBox(
              height: 30,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                color: const Color.fromARGB(255, 150, 217, 234),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      '${widget.data['men_title']} ${widget.data['men_fname']} ${widget.data['men_lname']}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text('ประเภทการทำงาน : ${widget.data['men_type']}',
                        style: const TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    // ignore: prefer_const_constructors
                    Icon(
                      Icons.call,
                      color: Colors.blue,
                      size: 30,
                    ),
                    Text(
                      '   ${widget.data['men_phone']}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      width: 120,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    const Icon(
                      Icons.map,
                      color: Colors.blue,
                    ),
                    Text(
                      '''   ${widget.data['adr1']} ${widget.data['adr2']} 
    ${widget.data['city']}''',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 162),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(70, 15, 70, 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: const Color.fromARGB(255, 232, 92, 22),
                primary: const Color.fromARGB(255, 255, 255, 255),
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                removeBooking('${widget.data['book_id']}', context);
              },
              child: const Text('ยกเลิกนัด'),
            ),
          ],
        ),
      ),
    );
  }
}
