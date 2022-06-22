import 'package:flutter/material.dart';
import '../../models/text_model2.dart';

class ProfileAddress extends StatefulWidget {
  const ProfileAddress({Key? key, required this.data}) : super(key: key);
  final dynamic data;
  @override
  State<ProfileAddress> createState() => _ProfileAddressState();
}

class _ProfileAddressState extends State<ProfileAddress> {
  TextEditingController address = TextEditingController();
  @override
  void initState() {
    super.initState();
    address.text = widget.data['address'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 45, 134, 156),
      ),
      body: SizedBox(
          child: Column(children: [
        const SizedBox(height: 15),
        TextFormFieldModel2(
          labelText: 'address',
          controller: address,
        ),
        TextButton(onPressed: () {}, child: const Text('ยืนยันการแก้ไข'))
      ])),
    );
  }
}
