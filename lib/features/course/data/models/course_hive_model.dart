import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entity/course.dart';

part 'course_hive_model.g.dart';

@HiveType(typeId: 2)
class CourseHiveModel extends HiveObject {
  CourseHiveModel({String? courseId, this.courseName})
      : courseId = courseId ?? const Uuid().v4();

  @HiveField(0)
  final String? courseId;

  @HiveField(1)
  final String? courseName;

  CourseHiveModel.empty()
      : courseId = const Uuid().v4(),
        courseName = '';

  // Convert to CourseEntity from CourseHiveModel
  CourseEntity toCourseEntity() {
    return CourseEntity(
      courseId: courseId,
      courseName: courseName,
    );
  }

  // Convert to List<CourseEntity> from List<CourseHiveModel>
  List<CourseEntity> toCourseEntities(List<CourseHiveModel> courses) {
    return courses.map((course) => course.toCourseEntity()).toList();
  }

  // Convert to CourseHiveModel from CourseEntity
  CourseHiveModel castFromEntity(CourseEntity course) {
    return CourseHiveModel(
      courseId: course.courseId,
      courseName: course.courseName,
    );
  }

  @override
  String toString() => 'Course(courseId: $courseId, courseName: $courseName)';
}
