import 'package:aemart/core/usecases/usecase.dart';
import 'package:aemart/data/auth/models/user_creation_req.dart';
import 'package:aemart/domain/auth/repository/auth_repository.dart';
import 'package:aemart/service_locator.dart';
import 'package:dartz/dartz.dart';

class SignUpUseCase implements UseCase<Either, UserCreationReq> {
  @override
  Future<Either> call({UserCreationReq? params}) async {
    return await sl<AuthRepository>().signUp(params!);
  }
}
