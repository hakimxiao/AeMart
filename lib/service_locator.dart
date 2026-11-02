import 'package:aemart/data/auth/repository/auth_repository_impl.dart';
import 'package:aemart/data/auth/source/auth_firebase_service.dart';
import 'package:aemart/domain/auth/repository/auth_repository.dart';
import 'package:aemart/domain/auth/usecases/sign_up.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Services
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // Usecases
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
}
