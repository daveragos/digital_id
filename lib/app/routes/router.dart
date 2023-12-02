import 'package:digital_id/app/constants/path_const.dart';
import 'package:digital_id/domain/entities/user.dart';
import 'package:digital_id/presentation/pages/home_card_page.dart';
import 'package:digital_id/presentation/pages/qr_page.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';

final router = GoRouter(
  initialLocation: PathConst.digitalIdPath,
  routes: [
    GoRoute(
        path: PathConst.digitalIdPath,
        name: 'home_card',
        builder: (context, state) => CreditCardScreen(),
        routes: [
          GoRoute(
            path: PathConst.userPath,
            builder: (context, state) {
              final user = state.pathParameters['user'];
              return QRPage(userId: user!);
            },
          ),
        ]),
  ],
);
