import 'package:flutter/material.dart';
import 'package:flutter_appcare/configs/api.dart';
import 'package:flutter_appcare/views/carddetail.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/search_page.dart';
import '../models/side_menu.dart';

class InputMentor extends StatefulWidget {
  const InputMentor({Key? key, data}) : super(key: key);
  @override
  State<InputMentor> createState() => _InputMentorState();
}

class _InputMentorState extends State<InputMentor> {
  dynamic data;

  @override
  void initState() {
    super.initState();
    startApi();
  }

  startApi() async {
    var item = await inputmentor();
    setState(() {
      data = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 227, 227),
      appBar: AppBar(
        title: const Text('หาพี่เลี้ยง'),
        backgroundColor: const Color.fromARGB(255, 45, 134, 156),
        actions: [
          // Navigate to the Search Screen
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SearchPage())),
              icon: Icon(Icons.search))
        ],
      ),
      body: SafeArea(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: RefreshIndicator(
              onRefresh: () async {
                startApi();
              },
              child: ListView.builder(
                itemCount: data?.length ?? 0,
                itemBuilder: (context, i) => InkWell(
                  // onTap: () => Navigator.pushNamed(context, "/CDT"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                Carddetail(data: data[i])));
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
                                  width: 10,
                                ),
                                const SizedBox(
                                  width: 55.0,
                                  height: 55.0,
                                  // color: Color.fromARGB(255, 150, 217, 234),
                                  // ignore: prefer_const_constructors
                                  child: CircleAvatar(),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(22),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${data[i]['men_title']} ${data[i]['men_fname']} ${data[i]['men_lname']}',
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text('Rate/hr: ${data[i]['men_rate']}'),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        '${data[i]['men_phone']}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          RatingBarIndicator(
                                            //ดาวคะแนน---------------------**********************************
                                            rating: double.parse(data[i]
                                                        ['averageRatting'] !=
                                                    null
                                                ? '${data[i]['averageRatting']}'
                                                : '0'),
                                            itemSize: 20,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 1),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                          ),
                                          Text('(${data[i]['countScore']})')
                                        ],
                                      ),
                                      // Text(
                                      //     'ผู้รีวิว :${data[i]['countScore']}   จำนวนคะแนน :${data[i]['averageRatting']}')
                                    ],
                                  ),
                                ),
                              ])
                        ]),
                  ),
                ),
              ),
            )),
      ),
      drawer: const SideMenu(),
    );
  }
}
