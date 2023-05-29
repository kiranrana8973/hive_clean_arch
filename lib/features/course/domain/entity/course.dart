import 'package:hive_flutter/hive_flutter.dart';

class CourseEntity extends HiveObject {
  CourseEntity({this.courseId, this.courseName});

  final String? courseId;

  final String? courseName;
}
