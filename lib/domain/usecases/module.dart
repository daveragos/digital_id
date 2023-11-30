import 'package:digital_id/data/repositories/module.dart';
import 'package:digital_id/domain/usecases/get_user_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getUserProvider = Provider<GetUsersUseCaseImpl>((ref) {
  return GetUsersUseCaseImpl(ref.read(userProvider));
});
