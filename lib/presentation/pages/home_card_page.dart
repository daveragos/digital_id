import 'package:digital_id/app/constants/path_const.dart';
import 'package:digital_id/app/utils/extensions.dart';
import 'package:digital_id/presentation/widgets/qr_widget.dart';
import 'package:digital_id/presentation/providers/providers.dart';
import 'package:digital_id/presentation/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:go_router/go_router.dart';

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
    final color = context.colorScheme;
    return Scaffold(
      backgroundColor: color.secondaryContainer,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Digital Cards'),
      ),
      drawer: _buildDrawer(color, context),
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
                  return Container(
                    decoration: BoxDecoration(
                        color: color.secondaryContainer,
                        borderRadius: BorderRadius.circular(20.0)),
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const CircleAvatar(
                            radius: 30,
                            child: Icon(
                              Icons.join_right,
                              size: 50,
                            )),
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
              return const CardWidget();
            },
          ),
          const QRWidget(),
        ],
      ),
    );
  }

  Drawer _buildDrawer(ColorScheme color, BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: color.primaryContainer,
            ),
            child: Column(
              children: [
                Text(
                  'Digital ID',
                  style: context.textTheme.displayMedium,
                ),
                CircleAvatar(
                  radius: 35,
                  child: Icon(Icons.qr_code,
                      size: 50, color: Colors.white.withOpacity(0.8)),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              context.pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              context.push(PathConst.profilePath);
            },
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
