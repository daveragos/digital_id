import 'package:digital_id/app/utils/extensions.dart';
import 'package:digital_id/domain/usecases/module.dart';
import 'package:digital_id/presentation/providers/providers.dart';
import 'package:digital_id/presentation/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math' as math;

import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class CreditCardScreen extends ConsumerWidget {
  final List<String> cardNumbers = [
    "**** **** **** 1234",
    "**** **** **** 5678",
    "**** **** **** 9012",
    "**** **** **** 3456",
    "**** **** **** 7890"
  ];

  final List<String> cardHolders = [
    "John Doe",
    "Jane Smith",
    "Alice Johnson",
    "Bob Williams",
    "John Doer"
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userStateNotifierProvider);

    final color = context.colorScheme;
    return Scaffold(
      backgroundColor: color.secondaryContainer,
      appBar: AppBar(
        title: const Text('Credit Cards'),
      ),
      body: Column(
        children: [
          Swiper(
            allowImplicitScrolling: true,
            loop: true,
            onTap: (index) {
              //show bottom sheet all the way to the card that shows the detail of the tapped index info

              showModalBottomSheet(
                context: context,
                builder: (context) {
                  final usered = user[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28.0, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const CircleAvatar(child: Icon(Icons.person)),
                        ListTile(title: Text('Name : ${usered.name}')),
                        ListTile(
                          title: Text('Name : ${usered.role}'),
                        ),
                        ListTile(
                          title: Text('Name : ${usered.phoneNumber}'),
                        ),
                        ElevatedButton(
                            onPressed: () {}, child: const Text('Scan Me'))
                      ],
                    ),
                  );
                },
              );
            },
            itemCount: cardNumbers.length,
            layout: SwiperLayout.TINDER,
            itemWidth: 385,
            itemHeight: 225,
            itemBuilder: (BuildContext context, int index) {
              return CardWidget(user: user[index]);
            },
          ),
        ],
      ),
    );
  }
}
