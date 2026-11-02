import 'package:aemart/data/auth/models/user_creation_req.dart';
import 'package:aemart/data/auth/source/auth_firebase_service.dart';
import 'package:aemart/domain/auth/repository/auth_repository.dart';
import 'package:aemart/service_locator.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either<dynamic, dynamic>> signUp(UserCreationReq user) async {
    return sl<AuthFirebaseService>().signUp(user);
  }

  @override
  Future<Either> getAges() async {
    return await sl<AuthFirebaseService>().getAges();
  }
}
