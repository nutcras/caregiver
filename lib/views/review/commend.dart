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
    var item = await inputcommend('${widget.data1['idm']}');
    setState(() {
      data = item;
    });
  }

  rattingS(i) {
    ratting = double.parse('${data[i]['score']}');
    return ratting;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Commend'),
        ),
        body: SizedBox(
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
                                  '${data[i]['fname']}',
                                  style: const TextStyle(fontSize: 15),
                                ),
                                RatingBarIndicator(
                                  //ดาวคะแนน---------------------**********************************
                                  rating: double.parse('3'),
                                  itemSize: 20,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 1),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                ),
                                Text(
                                  '${data[i]['review']}',
                                  style: const TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                          ),
                        ])
                  ]),
            ),
          ),
        )));
  }
}
