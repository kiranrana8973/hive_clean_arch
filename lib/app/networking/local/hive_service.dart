import 'dart:io';

import 'package:hive/hive.dart';
import 'package:hive_clean_arch/features/course/data/models/course_hive_model.dart';
import 'package:path_provider/path_provider.dart';

import '../../../features/auth/domain/entity/student_enitity.dart';
import '../../../features/batch/data/models/batch_hive_model.dart';

class HiveService {
  static const String studentBox = 'studentBox';
  static const String batchBox = 'batchBox';
  static const String courseBox = 'courseBox';

  // initialize Hive with database name
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    // Register the adapters
    registerAdapters();

    // Add dummy data
    addDummybatch();
    addDummyCourses();
  }

  // Register Adapter
  void registerAdapters() {
    Hive.registerAdapter<Student>(StudentAdapter());
    Hive.registerAdapter<BatchHiveModel>(BatchHiveModelAdapter());
    Hive.registerAdapter<CourseHiveModel>(CourseHiveModelAdapter());
  }

  // Insert batch dummy data
  Future<void> addDummybatch() async {
    // check of batch box is empty
    var box = await Hive.openBox<BatchHiveModel>(batchBox);
    if (box.isEmpty) {
      final batch1 = BatchHiveModel(batchName: '29-A');
      final batch2 = BatchHiveModel(batchName: '29-B');
      final batch3 = BatchHiveModel(batchName: '30-A');
      final batch4 = BatchHiveModel(batchName: '30-B');

      List<BatchHiveModel> batches = [batch1, batch2, batch3, batch4];

      addBatches(batches);
    }
  }

  // Insert Dummy courses
  Future<void> addDummyCourses() async {
    var box = await Hive.openBox<CourseHiveModel>(courseBox);
    if (box.isEmpty) {
      final course1 = CourseHiveModel(courseName: 'Flutter');
      final course2 = CourseHiveModel(courseName: 'Android');
      final course3 = CourseHiveModel(courseName: 'iOS');
      final course4 = CourseHiveModel(courseName: 'React Native');
      final course5 = CourseHiveModel(courseName: 'React JS');
      final course6 = CourseHiveModel(courseName: 'Node JS');

      List<CourseHiveModel> courses = [
        course1,
        course2,
        course3,
        course4,
        course5,
        course6
      ];

      addCourses(courses);
    }
  }

  // --------------------BatchHiveModel Box--------------------
  Future<void> addBatch(BatchHiveModel batch) async {
    var box = await Hive.openBox<BatchHiveModel>(batchBox);
    await box.put(batch.batchId, batch);
  }

  Future<void> addBatches(List<BatchHiveModel> batches) async {
    var box = await Hive.openBox<BatchHiveModel>(batchBox);
    for (var batch in batches) {
      await box.put(batch.batchId, batch);
    }
  }

  Future<BatchHiveModel> getBatch(String batchId) async {
    var box = await Hive.openBox<BatchHiveModel>(batchBox);
    return box.get(batchId) ?? BatchHiveModel(batchId: '', batchName: '');
  }

  Future<List<BatchHiveModel>> getBatches() async {
    var box = await Hive.openBox<BatchHiveModel>(batchBox);
    return box.values.toList();
  }

  Future<void> updateBatch(BatchHiveModel batch) async {
    var box = await Hive.openBox<BatchHiveModel>(batchBox);
    await box.put(batch.batchId, batch);
  }

  Future<void> deleteBatch(String batchId) async {
    var box = await Hive.openBox<BatchHiveModel>(batchBox);
    await box.delete(batchId);
  }

  // --------------------CourseHiveModel Box--------------------
  Future<void> addCourse(CourseHiveModel course) async {
    var box = await Hive.openBox<CourseHiveModel>(courseBox);
    await box.put(course.courseId, course);
  }

  // Add multiple course with a key
  Future<void> addCourses(List<CourseHiveModel> courses) async {
    var box = await Hive.openBox<CourseHiveModel>(courseBox);
    for (var course in courses) {
      await box.put(course.courseId, course);
    }
  }

  Future<List<CourseHiveModel>> getCourses() async {
    var box = await Hive.openBox<CourseHiveModel>(courseBox);
    return box.values.toList();
  }

  Future<void> updateCourse(CourseHiveModel course) async {
    var box = await Hive.openBox<CourseHiveModel>(courseBox);
    await box.put(course.courseId, course);
  }

  Future<void> deleteCourse(String courseId) async {
    var box = await Hive.openBox<CourseHiveModel>(courseBox);
    await box.delete(courseId);
  }

  // --------------------Student Box--------------------
  Future<void> registerStudent(Student student) async {
    var box = await Hive.openBox<Student>(studentBox);
    await box.add(student);
  }

  Future<List<Student>> getStudents() async {
    var box = await Hive.openBox<Student>(studentBox);
    return box.values.toList();
  }

  Future<void> updateStudent(Student student) async {
    var box = await Hive.openBox<Student>(studentBox);
    await box.put(student.id, student);
  }

  Future<void> deleteStudent(Student student) async {
    var box = await Hive.openBox<Student>(studentBox);
    await box.delete(student.id);
  }

  // Login
  Future<bool> login(String username, String password) async {
    var box = await Hive.openBox<Student>(studentBox);
    box.values.toList().map((e) {
      if (e.username == username && e.password == password) {
        return true;
      }
    });
    return false;
  }

  // --------------------BatchHiveModel Student--------------------
  Future<List<Student>> getStudentsByBatch(String batchId) async {
    var box = await Hive.openBox<Student>(studentBox);
    return box.values
        .where((element) => element.batch!.batchId == batchId)
        .toList();
  }

  // --------------------CourseHiveModel Student--------------------
  Future<List<Student>> getStudentsByCourse(String courseId) async {
    var box = await Hive.openBox<Student>(studentBox);
    return box.values.where((element) => element.course == courseId).toList();
  }

  // --------------------Close all boxes--------------------
  // Close all boxes
  Future<void> closeAllBoxes() async {
    await Hive.close();
  }

  // Delete Hive database
  Future<void> deleteHiveDatabase() async {
    closeAllBoxes();
    var dir = await getApplicationDocumentsDirectory();
    await Directory(dir.path).delete(recursive: true);
  }
}
