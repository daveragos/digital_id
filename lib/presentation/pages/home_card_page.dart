import 'package:digital_id/app/utils/extensions.dart';
import 'package:digital_id/domain/entities/company.dart';
import 'package:digital_id/presentation/pages/qr_page.dart';
import 'package:digital_id/presentation/providers/providers.dart';
import 'package:digital_id/presentation/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:go_router/go_router.dart';

class CreditCardScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends ConsumerState<CreditCardScreen> {
  // late final List<Company> companies;
  final List<Company> listOfCompanies = [
    Company(
      name: 'google',
      role: 'ceo',
      email: 'google@gmail.com',
      address: 'silicon',
      phoneNumber: '09****09',
    ),
    Company(
      name: 'facebook',
      role: 'marketting',
      email: 'facebook@gmail.com',
      address: 'silicon',
      phoneNumber: '09****09',
    ),
    Company(
      name: 'amazon',
      role: 'sales',
      email: 'amazon@gmail.com',
      address: 'silicon',
      phoneNumber: '09****09',
    ),
    Company(
      name: 'apple',
      role: 'cto',
      email: 'apple@gmail.com',
      address: 'silicon',
      phoneNumber: '09****09',
    ),
    Company(
      name: 'microsoft',
      role: 'freelancer',
      email: 'microsoft@gmail.com',
      address: 'silicon',
      phoneNumber: '09****09',
    ),
    Company(
      name: 'twitter',
      role: 'intern',
      email: 'twitter@gmail.com',
      address: 'silicon',
      phoneNumber: '09****09',
    ),
  ];
  @override
  void initState() {
    super.initState();
    ref.read(companyProvider.notifier).state = listOfCompanies;
    // companies = ref.read(companyProvider.notifier).state;
  }

  @override
  Widget build(BuildContext context) {
    // final user = ref.watch(userStateNotifierProvider);
    final user = ref.watch(userProvider.notifier).state;
    final companies = ref.watch(companyProvider.notifier).state;

    int currentQR = 0;
    final color = context.colorScheme;
    return Scaffold(
      backgroundColor: color.secondaryContainer,
      appBar: AppBar(
        title: const Text('Credit Cards'),
      ),
      drawer: Drawer(
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
      ),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Swiper(
            itemCount: companies.length,
            allowImplicitScrolling: true,
            loop: true,
            onIndexChanged: (index) {
              currentQR = index;
            },
            onTap: (index) {
              //show bottom sheet all the way to the card that shows the detail of the tapped index info

              showModalBottomSheet(
                context: context,
                builder: (context) {
                  final usered = companies[index];
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
                          title: Text('Name : ${usered.name}'),
                        ),
                        ListTile(
                          title: Text('Name : ${usered.phoneNumber}'),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              context.go('/home_card/$index');
                            },
                            child: const Text('Scan Me'))
                      ],
                    ),
                  );
                },
              );
            },
            layout: SwiperLayout.TINDER,
            itemWidth: 385,
            itemHeight: 225,
            itemBuilder: (BuildContext context, int index) {
              return CardWidget(index: index);
            },
          ),
          Expanded(
            child: QRPage(
              userId: currentQR,
            ),
          ),
        ],
      ),
    );
  }
}
