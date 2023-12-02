import 'package:digital_id/data/repositories/user_repo_impl.dart';
import 'package:digital_id/data/sources/module.dart';
import 'package:digital_id/domain/repositories/user_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = Provider<UserRepo>((ref) {
  return UserRepoImpl(ref.read(useLocalDBProvider), ref.read(apiProvider));
});
