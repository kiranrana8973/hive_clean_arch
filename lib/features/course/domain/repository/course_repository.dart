import 'package:dartz/dartz.dart';

import '../../../../app/error/failure.dart';
import '../entity/course.dart';

abstract class CourseRepository {
  Future<Either<Failure, List<CourseEntity>>> getCourses();
  Future<Either<Failure, bool>> createCourse(CourseEntity course);
  Future<Either<Failure, bool>> updateCourse(CourseEntity course);
  Future<Either<Failure, bool>> deleteCourse(String courseId);
}
