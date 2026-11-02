import 'package:aemart/data/auth/models/user_creation_req.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either> signUp(UserCreationReq user);
  Future<Either> getAges();
}
