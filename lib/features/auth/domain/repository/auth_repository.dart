import 'package:dartz/dartz.dart';

import '../../../../app/error/failure.dart';
import '../entity/student_enitity.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> login(String email, String password);
  Future<Either<Failure, bool>> register(Student student);
}
