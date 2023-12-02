import 'package:digital_id/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardWidget extends ConsumerWidget {
  final int index;

  const CardWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final companies = ref.watch(companyProvider);
    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
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
                  Text(companies[index].name,
                      textAlign: TextAlign.center, style: style),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Icon(
                    Icons.devices_other_outlined,
                  )
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
                          Text('Name : ${user.name}', style: style),
                          Text('Role : ${companies[index].role}', style: style),
                          Text('Email: ${user.email}', style: style),
                          Text('Phone Number : ${user.phoneNumber}',
                              style: style),
                          Text(
                            'Expiration Date : ${user.role}',
                            style: style.copyWith(
                              color: Colors.red,
                            ),
                          ),
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
