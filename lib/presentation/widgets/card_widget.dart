import 'package:digital_id/domain/entities/user.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final User user;

  const CardWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Omishtu-Joy',
                      textAlign: TextAlign.center, style: style),
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(Icons.branding_watermark)
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Expanded(child: Placeholder()),
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(user.name, style: style),
                          Text(user.email, style: style),
                          Text(user.address, style: style),
                          Text(user.role, style: style),
                          Text(user.phoneNumber, style: style),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
