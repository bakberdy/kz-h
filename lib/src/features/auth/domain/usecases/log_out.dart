import 'package:kz_h/src/core/usecase/usecase.dart';
import 'package:kz_h/src/features/auth/domain/repositories/auth_repository.dart';

class LogOut implements UseCase<void, NoParams>{
  final AuthRepository repository;

  LogOut(this.repository);

  @override
  Future<void> call({required NoParams params}) {
    return repository.logOut();
  }

}