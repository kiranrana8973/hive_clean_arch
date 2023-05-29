import 'package:dartz/dartz.dart';
import 'package:hive_clean_arch/features/course/domain/repository/course_repository.dart';

import '../../../../app/error/failure.dart';
import '../entity/course.dart';

class CourseUseCase {
  final CourseRepository _courseRepository;

  CourseUseCase(this._courseRepository);

  Future<Either<Failure, bool>> createCourse(CourseEntity course) async {
    return await _courseRepository.createCourse(course);
  }

  Future<Either<Failure, List<CourseEntity>>> getCourses() async {
    return await _courseRepository.getCourses();
  }

  Future<Either<Failure, bool>> updateCourse(CourseEntity course) async {
    return await _courseRepository.updateCourse(course);
  }

  Future<Either<Failure, bool>> deleteCourse(String courseId) async {
    return await _courseRepository.deleteCourse(courseId);
  }
}
