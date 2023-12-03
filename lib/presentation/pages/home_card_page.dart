import 'package:digital_id/app/utils/extensions.dart';
import 'package:digital_id/presentation/widgets/qr_widget.dart';
import 'package:digital_id/presentation/providers/providers.dart';
import 'package:digital_id/presentation/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class CreditCardScreen extends ConsumerStatefulWidget {
  const CreditCardScreen({super.key});

  @override
  ConsumerState<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends ConsumerState<CreditCardScreen> {
  @override
  Widget build(BuildContext context) {
    // final user = ref.watch(userStateNotifierProvider);
    final companies = ref.watch(companyProvider.notifier).state;
    final selectedCompany = ref.watch(selectedCompanyProvider);

    int currentQR = 0;
    final color = context.colorScheme;
    return Scaffold(
      backgroundColor: color.secondaryContainer,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Digital Cards'),
      ),
      drawer: _buildDrawer(color),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Swiper(
            index: selectedCompany,
            itemCount: companies.length,
            allowImplicitScrolling: true,
            loop: true,
            onIndexChanged: (index) {
              ref.read(selectedCompanyProvider.notifier).state = index;
            },
            onTap: (index) {
              //show bottom sheet all the way to the card that shows the detail of the tapped index info
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  final company = companies[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28.0, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const CircleAvatar(child: Icon(Icons.person)),
                        ListTile(title: Text('Name : ${company.name}')),
                        ListTile(
                          title: Text('Email : ${company.email}'),
                        ),
                        ListTile(
                          title: Text('Phone Number : ${company.phoneNumber}'),
                        ),
                        ListTile(
                          title: Text('Address : ${company.address}'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            layout: SwiperLayout.TINDER,
            itemWidth: 400,
            itemHeight: 250,
            itemBuilder: (BuildContext context, int index) {
              return CardWidget(index: index);
            },
          ),
          QRWidget(),
        ],
      ),
    );
  }

  Drawer _buildDrawer(ColorScheme color) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: color.primaryContainer,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  child: Icon(Icons.qr_code,
                      size: 50, color: Colors.white.withOpacity(0.8)),
                ),
                Text(
                  'Digital ID',
                  style: TextStyle(color: color.onBackground),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
