import 'package:flutter/material.dart';
import 'package:flutter_appcare/views/booking/selectBook.dart';

class Carddetail extends StatefulWidget {
  const Carddetail({Key? key, required this.data}) : super(key: key);
  final dynamic data;

  @override
  State<Carddetail> createState() => _CarddetailState();
}

class _CarddetailState extends State<Carddetail> {
  TextEditingController idMentor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ข้อมูลพนักงงาน'),
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
                backgroundColor: Color.fromARGB(255, 45, 134, 156),
                // backgroundImage: ('widget.data['image']'),
              ),
            ),
            const SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                color: const Color.fromARGB(255, 150, 217, 234),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'ชื่อ ${widget.data['fname']} ${widget.data['lname']}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text('ราคาต่อชั่วโมง ${widget.data['rate']}',
                        style: const TextStyle(fontSize: 18)),
                    Text('${widget.data['type']}',
                        style: const TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
                child: Row(
              children: [
                const SizedBox(width: 30),
                const Icon(
                  Icons.call,
                  color: Colors.blue,
                  size: 30,
                ),
                Text(
                  '   ${widget.data['phone']}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 120),
              ],
            )),
            const SizedBox(height: 20),
            Row(children: [
              Row(
                children: [
                  const SizedBox(
                    width: 30,
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
                ],
              ),
              const SizedBox(width: 50),
            ]),
            const SizedBox(height: 30),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(70, 15, 70, 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: const Color.fromARGB(255, 32, 204, 187),
                primary: const Color.fromARGB(255, 255, 255, 255),
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                        builder: (context) =>
                            SelectBooking(data: widget.data)));
              },
              child: const Text(
                'นัดเวลา',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DatePickerNotifier extends ChangeNotifier {
  DateTime? _selectedDateTime;
  DateTime? get selectDateTime => _selectedDateTime;
  setDateTime({required DateTime candidateDateTime}) {
    _selectedDateTime = candidateDateTime;
    notifyListeners();
  }
}
