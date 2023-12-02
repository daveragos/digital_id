import 'package:digital_id/domain/entities/user.dart';
import 'package:digital_id/domain/usecases/module.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserStateNotifier extends StateNotifier<List<User>> {
  UserStateNotifier(this.ref) : super([]) {
    getUsers();
  }
  final Ref ref;
  late final getUsersProvider = ref.read(getUserProvider);

  Future<void> getUsers() async {
    state = await getUsersProvider.call();
  }
}

final userStateNotifierProvider =
    StateNotifierProvider<UserStateNotifier, List<User>>(
        (ref) => UserStateNotifier(ref));
