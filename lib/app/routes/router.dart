import 'package:digital_id/app/constants/path_const.dart';
import 'package:digital_id/presentation/pages/home_card_page.dart';
import 'package:digital_id/presentation/pages/login_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: PathConst.digitalIdPath,
      name: 'home_card',
      builder: (context, state) => CreditCardScreen(),
    ),
  ],
);
