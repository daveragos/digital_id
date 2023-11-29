import 'package:flutter/material.dart';

class HomeCardPage extends StatefulWidget {
  const HomeCardPage({super.key});

  @override
  State<HomeCardPage> createState() => _HomeCardPageState();
}

class _HomeCardPageState extends State<HomeCardPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home Card Page'),
      ),
    );
  }
}
