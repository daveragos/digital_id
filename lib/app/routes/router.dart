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
        routes: <RouteBase>[
          GoRoute(
            path: PathConst.userPath,
            builder: (context, state) {
              final userJson = state.pathParameters['user'];
              // Convert the userJson string to a Map
              final userMap = jsonDecode(userJson!);
              // Convert the Map to a User object
              final user = User.fromJson(userMap);
              return QRPage(user: user);
            },
          ),
        ]),
  ],
);
