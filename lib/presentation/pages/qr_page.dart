import 'package:digital_id/domain/entities/user.dart';
import 'package:flutter/material.dart';

class QRPage extends StatefulWidget {
  QRPage({super.key, required this.user});
  User user;

  @override
  State<QRPage> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('QR Page'),
          const SizedBox(
            height: 20,
          ),
          Text('${widget.user.name} at ${widget.user.role} company'),
          const SizedBox(
            height: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/daveragoose.png'),
          ),
          const SizedBox(
            height: 20,
          ),
          const ListTile(
            leading: Icon(Icons.qr_code_scanner_outlined),
            title: Text('Scan Me'),
          ),
        ],
      ),
    );
  }
}
