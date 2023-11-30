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
            onIndexChanged: (index) {
              // //print the user on that index
              // final usernow = user[index];
              // print('the selected user is : $usernow');
            },
            allowImplicitScrolling: true,
            loop: true,
            onTap: (index) {
              //show bottom sheet all the way to the card that shows the detail of the tapped index info

              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const Wrap(
                    children: [
                      ListTile(
                        leading: Icon(Icons.share),
                        title: Text('Share'),
                      ),
                      ListTile(
                        leading: Icon(Icons.copy),
                        title: Text('Copy Link'),
                      ),
                      ListTile(
                        leading: Icon(Icons.edit),
                        title: Text('Edit'),
                      ),
                    ],
                  );
                },
              );
            },
            itemCount: cardNumbers.length,
            layout: SwiperLayout.TINDER,
            itemWidth: 385,
            itemHeight: 225,
            itemBuilder: (BuildContext context, int index) {
              return CreditCardWidget(
                cardNumber: cardNumbers[index],
                cardHolder: cardHolders[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
