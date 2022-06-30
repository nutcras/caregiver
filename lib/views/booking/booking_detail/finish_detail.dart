import 'package:flutter/material.dart';
import 'package:flutter_appcare/configs/api.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class FinishDetail extends StatefulWidget {
  const FinishDetail({Key? key, required this.data}) : super(key: key);

  final dynamic data;
  @override
  State<FinishDetail> createState() => _BookdetailState2();
}

class _BookdetailState2 extends State<FinishDetail> {
  TextEditingController review = TextEditingController();
  TextEditingController score = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      score.text = "5";
    });
  }

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
                    DateFormat('dd-mm-yy' '  เวลา : HH:mm')
                        .format(DateTime.parse('${widget.data['start_time']}')),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                'ถึง  :  ' +
                    DateFormat('dd-mm-yy  ' 'เวลา : HH:mm')
                        .format(DateTime.parse('${widget.data['end_time']}')),
                style: const TextStyle(
                  fontSize: 16,
                ),
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
                      '${widget.data['title']} ${widget.data['fname']} ${widget.data['lname']}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text('ประเภทการทำงาน : ${widget.data['type']}',
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
                      '   ${widget.data['phone']}',
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
            const SizedBox(height: 50),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(70, 15, 70, 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: Color.fromARGB(255, 68, 166, 196),
                primary: const Color.fromARGB(255, 255, 255, 255),
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                // removeBooking('${widget.data['idb']}', context);
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: const Text('ตรวจสอบการยืนยัน'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 20),
                              RatingBar.builder(
                                initialRating: 5,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  score.text = rating.toString();
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: review,
                                maxLines: 2,
                                decoration: InputDecoration(
                                  labelText:
                                      'แบ่งปันประสบการณ์ของคุณด้วยการีวิวบริการได้ที่นี่!',
                                  hintText: '255 ตัวอักษร',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 92, 92, 92)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: (() {
                                  sendReview(widget.data['idb'], review.text,
                                      score.text, context);
                                }),
                                child: const Text('ยืนยัน'),
                              )
                            ],
                          ),
                        ));
              },
              child: const Text('รีวิว'),
            ),
          ],
        ),
      ),
    );
  }
}
