import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../configs/api.dart';

class CommendPage extends StatefulWidget {
  CommendPage({Key? key, required this.data1}) : super(key: key);
  dynamic data1;
  @override
  State<CommendPage> createState() => _CommendPageState();
}

class _CommendPageState extends State<CommendPage> {
  dynamic data;
  late double ratting;
  @override
  void initState() {
    super.initState();
    startApi();
  }

  startApi() async {
    var item = await inputcommend('${widget.data1['men_id']}');
    setState(() {
      data = item;
    });
  }

  rattingS(i) {
    ratting = double.parse('${data[i]['book_score']}');
    return ratting;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Commend'),
        ),
        body: SizedBox(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: data?.length ?? 0,
            itemBuilder: (context, i) => InkWell(
              child: Card(
                elevation: 10,
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
                              width: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.all(22),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${data[i]['cust_fname']}',
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  RatingBarIndicator(
                                    //????????????????????????---------------------**********************************
                                    rating: data[i]['book_score'] != null
                                        ? double.parse(
                                            "${data[i]['book_score']}")
                                        : 0,
                                    itemSize: 20,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 1),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${data[i]['book_review']}',
                                    style: const TextStyle(fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                          ])
                    ]),
              ),
            ),
          ),
        )));
  }
}
