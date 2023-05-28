import 'package:dartz/dartz.dart';
import 'package:hive_clean_arch/app/error/failure.dart';
import 'package:hive_clean_arch/app/networking/local/hive_service.dart';
import 'package:hive_clean_arch/features/course/domain/entity/course.dart';

import '../../domain/repository/course_repository.dart';

class CourseLocalRepository implements CourseRepository {
  final HiveService _hiveService;

  CourseLocalRepository(this._hiveService);

  @override
  Future<Either<Failure, bool>> createCourse(Course course) async {
    try {
      await _hiveService.addCourse(course);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteCourse(String courseId) async {
    try {
      await _hiveService.deleteCourse(courseId);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Course>>> getCourses() async {
    try {
      final courses = await _hiveService.getCourses();
      return Right(courses);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> updateCourse(Course course) async {
    try {
      await _hiveService.updateCourse(course);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
