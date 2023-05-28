import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'course.g.dart';

@HiveType(typeId: 2)
class Course extends HiveObject {
  Course({String? courseId, this.courseName})
      : courseId = courseId ?? const Uuid().v4();

  @HiveField(0)
  final String? courseId;

  @HiveField(1)
  final String? courseName;

  @override
  String toString() => 'Course(courseId: $courseId, courseName: $courseName)';
}
