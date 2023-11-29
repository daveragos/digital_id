import 'package:digital_id/app/utils/extensions.dart';
import 'package:digital_id/presentation/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class CreditCardScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
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
              debugPrint('the indexxxxx : $index');
            },
            itemCount: cardNumbers.length,
            layout: SwiperLayout.TINDER,
            itemWidth: 385,
            itemHeight: 225,
            onIndexChanged: (index) {
              debugPrint('the indexxxxx changed: $index');
            },
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
