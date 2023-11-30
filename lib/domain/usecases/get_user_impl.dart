import 'package:digital_id/domain/entities/user.dart';
import 'package:digital_id/domain/repositories/user_repo.dart';
import 'package:digital_id/domain/usecases/get_user.dart';

class GetUsersUseCaseImpl extends GetUsersUseCase {
  GetUsersUseCaseImpl(this.userRepo);
  final UserRepo userRepo;
  @override
  Future<List<User>> call() async {
    return await userRepo.getUser();
  }
}
