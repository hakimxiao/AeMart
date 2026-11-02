import 'package:aemart/data/auth/models/user_creation_req.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(UserCreationReq user);
  Future<Either> getAges();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either<dynamic, dynamic>> signUp(UserCreationReq user) async {
    try {
      var returnedData = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email!,
            password: user.password!,
          );

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(returnedData.user!.uid)
          .set({
            'firstName': user.firstName,
            'lastName': user.lastName,
            'email': user.email,
            'gender': user.gender,
            'age': user.age,
          });

      return const Right('Sign up successful');
    } on FirebaseAuthException catch (err) {
      String message = '';

      if (err.code == 'weak-password') {
        message = 'The password provided is too weak,';
      } else if (err.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = err.message ?? 'An unknown error occurred.';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Ages')
          .get();
      return Right(returnedData.docs);
    } catch (err) {
      return const Left('Please try again');
    }
  }
}
