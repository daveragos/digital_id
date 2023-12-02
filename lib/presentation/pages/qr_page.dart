import 'package:digital_id/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:digital_id/app/utils/extensions.dart';

class QRPage extends ConsumerWidget {
  QRPage({super.key, required this.userId});
  int userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = context.colorScheme;
    final user = ref.watch(userStateNotifierProvider);
    final selectedUser = user[userId];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('QR Page'),
        const SizedBox(
          height: 20,
        ),
        Text('${selectedUser.name} at ${selectedUser.role} company'),
        const SizedBox(
          height: 20,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset('assets/daveragoose.png'),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          color: color.primary,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: const Row(
            children: [
              Icon(Icons.qr_code_scanner_outlined),
              Text('Scan Me'),
            ],
          ),
        ),
      ],
    );
  }
}
