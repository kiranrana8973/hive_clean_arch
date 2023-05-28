import 'package:dartz/dartz.dart';

import '../../../../app/error/failure.dart';
import '../entity/course.dart';

abstract class CourseRepository {
  Future<Either<Failure, List<Course>>> getCourses();
  Future<Either<Failure, bool>> createCourse(Course course);
  Future<Either<Failure, bool>> updateCourse(Course course);
  Future<Either<Failure, bool>> deleteCourse(String courseId);
}
