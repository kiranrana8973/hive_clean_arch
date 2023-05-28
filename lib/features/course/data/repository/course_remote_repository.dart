import 'package:dartz/dartz.dart';
import 'package:hive_clean_arch/app/error/failure.dart';
import 'package:hive_clean_arch/features/course/domain/entity/course.dart';
import 'package:hive_clean_arch/features/course/domain/repository/course_repository.dart';

class CourseRemoteRepository implements CourseRepository {
  @override
  Future<Either<Failure, bool>> createCourse(Course course) {
    // TODO: implement createCourse
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> deleteCourse(String courseId) {
    // TODO: implement deleteCourse
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Course>>> getCourses() {
    // TODO: implement getCourses
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> updateCourse(Course course) {
    // TODO: implement updateCourse
    throw UnimplementedError();
  }
}
