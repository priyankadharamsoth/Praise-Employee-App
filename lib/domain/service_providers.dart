import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/data_service_providers.dart';
import '../data/repositories_impl/auth_repository_impl.dart';
import '../data/repositories_impl/news_repository_impl.dart';
import '../data/repositories_impl/praise_employee_repository_impl.dart';
import '../data/repositories_impl/praise_repository_impl.dart';
import '../data/repositories_impl/user_repository_impl.dart';
import '../data/repositories_impl/employee_repository_impl.dart';
import 'repositories/auth_repository.dart';
import 'repositories/news_repository.dart';
import 'repositories/praise_employee_repository.dart';
import 'repositories/praise_repository.dart';
import 'repositories/user_repository.dart';
import 'repositories/employee_repository.dart';

part 'service_providers.g.dart';

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepositoryImpl(ref.watch(userRemoteDataSourceProvider),
      ref.watch(userLocalDataSourceProvider));
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(ref.watch(userRepositoryProvider));
}

@Riverpod(keepAlive: true)
NewsRepository newsRepository(NewsRepositoryRef ref) {
  return NewsRepositoryImpl(ref.watch(newsRemoteDataSourceProvider));
}

@Riverpod(keepAlive: true)
EmployeeRepository employeeRepository(EmployeeRepositoryRef ref) {
  return EmployeeRepoImpl(ref.watch(employeeRemoteDataSourceProvider));
}

@Riverpod(keepAlive: true)
PraiseRepository praiseRepository(PraiseRepositoryRef ref) {
  return PraiseRepositoryImpl(ref.watch(praiseRemoteDataSourceProvider));
}

@Riverpod(keepAlive: true)
PraiseEmployeeRepository praiseEmployeeRepository(
    PraiseEmployeeRepositoryRef ref) {
  return PraiseEmployeeRepoImpl(
      ref.watch(praiseEmployeeRemoteDataSourceProvider));
}
