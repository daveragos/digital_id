import 'package:digital_id/domain/entities/company.dart';
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

  Future<User> login(String email, String password) async {
    return await ref.read(loginProvider).call(email, password);
  }
}

final userStateNotifierProvider =
    StateNotifierProvider<UserStateNotifier, List<User>>(
        (ref) => UserStateNotifier(ref));

final userProvider = StateProvider<User>((ref) {
  return User(
    id: 0,
    name: 'name',
    email: 'email',
    address: 'address',
    phoneNumber: 'phoneNumber',
  );
});

final selectedCompanyProvider = StateProvider<int>((ref) {
  return 0;
});

final companyProvider = StateProvider<List<Company>>((ref) {
  return [];
});
