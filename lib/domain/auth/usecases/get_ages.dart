import 'package:aemart/core/usecases/usecase.dart';
import 'package:aemart/domain/auth/repository/auth_repository.dart';
import 'package:aemart/service_locator.dart';
import 'package:dartz/dartz.dart';

class GetAgesUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<AuthRepository>().getAges();
  }
}
