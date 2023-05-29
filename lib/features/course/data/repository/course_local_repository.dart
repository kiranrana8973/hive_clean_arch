import 'package:dartz/dartz.dart';
import 'package:hive_clean_arch/app/error/failure.dart';
import 'package:hive_clean_arch/app/networking/local/hive_service.dart';
import 'package:hive_clean_arch/features/course/data/models/course_hive_model.dart';
import 'package:hive_clean_arch/features/course/domain/entity/course.dart';

import '../../domain/repository/course_repository.dart';

class CourseLocalRepository implements CourseRepository {
  final HiveService _hiveService;
  final CourseHiveModel _courseHiveModel;

  CourseLocalRepository(this._hiveService, this._courseHiveModel);

  @override
  Future<Either<Failure, bool>> createCourse(CourseEntity course) async {
    try {
      await _hiveService.addCourse(_courseHiveModel.castFromEntity(course));
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
  Future<Either<Failure, List<CourseEntity>>> getCourses() async {
    try {
      final courses = await _hiveService.getCourses();
      return Right(_courseHiveModel.toCourseEntities(courses));
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> updateCourse(CourseEntity course) async {
    try {
      await _hiveService.updateCourse(_courseHiveModel.castFromEntity(course));
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
