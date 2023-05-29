import 'package:dartz/dartz.dart';
import 'package:hive_clean_arch/app/error/failure.dart';
import 'package:hive_clean_arch/app/networking/local/hive_service.dart';
import 'package:hive_clean_arch/features/auth/domain/entity/student_enitity.dart';
import 'package:hive_clean_arch/features/auth/domain/repository/auth_repository.dart';

class AuthLocalRepository implements AuthRepository {
  final HiveService _hiveService;

  AuthLocalRepository(this._hiveService);

  @override
  Future<Either<Failure, bool>> login(String email, String password) async {
    try {
      await _hiveService.login(email, password);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> register(Student student) async {
    try {
      await _hiveService.registerStudent(student);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
