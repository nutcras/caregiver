import 'package:flutter/material.dart';
import '../../configs/api.dart';
import 'book_detail.dart';
import 'package:intl/intl.dart';
import '../../models/sidemenu.dart';
import 'waitingbooking.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  dynamic data;

  @override
  void initState() {
    super.initState();
    startApi();
  }

  startApi() async {
    dynamic item = await getdata(72); //ส่งค่าไปยัง getdataหรือตัวรับapi
    setState(() {
      data = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('นัดหมาย'),
        backgroundColor: const Color.fromARGB(255, 45, 134, 156),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.timelapse_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => WaitingBooking()));

              // do something
            },
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: RefreshIndicator(
          onRefresh: () async {
            startApi();
          },
          child: ListView.builder(
            itemCount:
                data?.length ?? 0, //เอาออกไปก่อนเพราะตัวdata.lengthยังพังอยู่
            // itemCount: 3, //ใช้ตัวนี้แทนเพราะตัวdataพัง
            itemBuilder: (context, i) => InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            Bookdetail(data: data[i])));
              },
              child: Card(
                elevation: 10,
                color: const Color.fromARGB(255, 150, 217, 234),
                shadowColor: const Color.fromARGB(255, 10, 91, 111),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(
                              width: 15,
                            ),
                            const SizedBox(
                              width: 55.0,
                              height: 55.0,
                              child: CircleAvatar(),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              padding: const EdgeInsets.all(22),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${data[i]['title']} ${data[i]['fname']} ${data[i]['lname']}',
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    'เริ่ม : ' +
                                        DateFormat('dd-mm-yy HH:mm').format(
                                            DateTime.parse(
                                                '${data[i]['start_time']}')),
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'ถึง :  ' +
                                        DateFormat('dd-mm-yy HH:mm').format(
                                            DateTime.parse(
                                                '${data[i]['end_time']}')),
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ])
                    ]),
              ),
            ),
          ),
        ),
      ),
      drawer: SideMenu(), //หน้าปุ่มsidemenu
    );
  }
}
