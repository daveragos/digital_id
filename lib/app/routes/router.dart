import 'package:digital_id/app/constants/path_const.dart';
import 'package:digital_id/presentation/pages/home_card_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: PathConst.digitalIdPath,
  routes: [
    GoRoute(
        path: PathConst.digitalIdPath,
        name: 'home_card',
        builder: (context, state) => const HomeCardPage()),
  ],
);
