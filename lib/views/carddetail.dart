import 'package:flutter/material.dart';
import 'package:flutter_appcare/views/booking/select_book.dart';
import 'package:flutter_appcare/views/review/commend.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Carddetail extends StatefulWidget {
  const Carddetail({Key? key, required this.data}) : super(key: key);
  final dynamic data;

  @override
  State<Carddetail> createState() => _CarddetailState();
}

class _CarddetailState extends State<Carddetail> {
  TextEditingController idMentor = TextEditingController();
  late double ratting;

  @override
  void initState() {
    super.initState();
    ratting = widget.data['averageRatting'] != null
        ? double.parse('${widget.data['averageRatting']}')
        : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ข้อมูลพี่เลี้ยง'),
        backgroundColor: const Color.fromARGB(255, 45, 134, 156),
      ),
      body: SingleChildScrollView(
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
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                        builder: (context) => CommendPage(
                              data1: widget.data,
                            )));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBarIndicator(
                    //ดาวคะแนน---------------------**********************************
                    rating: ratting,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ),
                  Text('(${widget.data['countScore']})'),
                ],
              ),
            ),
            const SizedBox(height: 20),
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
                    Text('ราคาต่อชั่วโมง : ${widget.data['men_rate']}',
                        style: const TextStyle(fontSize: 18)),
                    Text('ประเภทการทำงาน : ${widget.data['men_type']}',
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
                  '   ${widget.data['men_phone']}',
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
                    '''   ${widget.data['men_tambons']} ${widget.data['men_amphures']} 
    ${widget.data['men_provices']} ${widget.data['men_pincode']}''',
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
