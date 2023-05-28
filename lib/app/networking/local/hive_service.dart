import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_clean_arch/config/constants/hive_constant.dart';
import 'package:path_provider/path_provider.dart';

import '../../../features/auth/domain/entity/student.dart';
import '../../../features/batch/domain/entity/batch.dart';
import '../../../features/course/domain/course.dart';

class HiveService {
  // initialize Hive with database name
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    // Register the adapters
    registerAdapters();

    // Add batches
    addDummybatch();
    addDummyCourses();
  }

  // Register Adapter
  void registerAdapters() {
    Hive.registerAdapter<Student>(StudentAdapter());
    Hive.registerAdapter<Batch>(BatchAdapter());
    Hive.registerAdapter<Course>(CourseAdapter());
  }

  // Insert batch dummy data
  Future<void> addDummybatch() async {
    // check of batch box is empty
    var box = await Hive.openBox<Batch>(HiveConstant.batchBox);
    if (box.isEmpty) {
      final batch1 = Batch(batchName: '29-A');
      final batch2 = Batch(batchName: '29-B');
      final batch3 = Batch(batchName: '30-A');
      final batch4 = Batch(batchName: '30-B');

      List<Batch> batches = [batch1, batch2, batch3, batch4];

      addBatches(batches);
    }
  }

  // Insert Dummy courses
  Future<void> addDummyCourses() async {
    var box = await Hive.openBox<Course>(HiveConstant.courseBox);
    if (box.isEmpty) {
      final course1 = Course(courseName: 'Flutter');
      final course2 = Course(courseName: 'Android');
      final course3 = Course(courseName: 'iOS');
      final course4 = Course(courseName: 'React Native');
      final course5 = Course(courseName: 'React JS');
      final course6 = Course(courseName: 'Node JS');

      List<Course> courses = [
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

  // --------------------Batch Box--------------------
  Future<void> addBatch(Batch batch) async {
    var box = await Hive.openBox<Batch>(HiveConstant.batchBox);
    await box.put(batch.batchId, batch);
  }

  Future<void> addBatches(List<Batch> batches) async {
    var box = await Hive.openBox<Batch>(HiveConstant.batchBox);
    for (var batch in batches) {
      await box.put(batch.batchId, batch);
    }
  }

  Future<List<Batch>> getBatches() async {
    var box = await Hive.openBox<Batch>(HiveConstant.batchBox);
    return box.values.toList();
  }

  Future<void> updateBatch(Batch batch) async {
    var box = await Hive.openBox<Batch>(HiveConstant.batchBox);
    await box.put(batch.batchId, batch);
  }

  Future<void> deleteBatch(Batch batch) async {
    var box = await Hive.openBox<Batch>(HiveConstant.batchBox);
    await box.delete(batch.batchId);
  }

  // --------------------Course Box--------------------
  Future<void> addCourse(Course course) async {
    var box = await Hive.openBox<Course>(HiveConstant.courseBox);
    await box.put(course.courseId, course);
  }

  // Add multiple course with a key
  Future<void> addCourses(List<Course> courses) async {
    var box = await Hive.openBox<Course>(HiveConstant.courseBox);
    for (var course in courses) {
      await box.put(course.courseId, course);
    }
  }

  Future<List<Course>> getCourses() async {
    var box = await Hive.openBox<Course>(HiveConstant.courseBox);
    return box.values.toList();
  }

  Future<void> updateCourse(Course course) async {
    var box = await Hive.openBox<Course>(HiveConstant.courseBox);
    await box.put(course.courseId, course);
  }

  Future<void> deleteCourse(String id) async {
    var box = await Hive.openBox<Course>(HiveConstant.courseBox);
    await box.delete(id);
  }

  // --------------------Student Box--------------------
  Future<void> addStudent(Student student) async {
    var box = await Hive.openBox<Student>(HiveConstant.studentBox);
    await box.add(student);
  }

  Future<List<Student>> getStudents() async {
    var box = await Hive.openBox<Student>(HiveConstant.studentBox);
    return box.values.toList();
  }

  Future<void> updateStudent(Student student) async {
    var box = await Hive.openBox<Student>(HiveConstant.studentBox);
    await box.put(student.id, student);
  }

  Future<void> deleteStudent(Student student) async {
    var box = await Hive.openBox<Student>(HiveConstant.studentBox);
    await box.delete(student.id);
  }

  // Login
  Future<bool> login(String username, String password) async {
    try {
      var box = await Hive.openBox<Student>(HiveConstant.studentBox);
      box.values.toList().map((e) {
        if (e.username == username && e.password == password) {
          return true;
        }
      });
      return false;
    } catch (e) {
      debugPrint('Error: $e');
      return false;
    }
  }

  // --------------------Batch Student--------------------
  Future<List<Student>> getStudentsByBatch(String batchId) async {
    var box = await Hive.openBox<Student>(HiveConstant.studentBox);
    return box.values
        .where((element) => element.batch!.batchId == batchId)
        .toList();
  }

  // --------------------Course Student--------------------
  Future<List<Student>> getStudentsByCourse(String courseId) async {
    var box = await Hive.openBox<Student>(HiveConstant.studentBox);
    return box.values.where((element) => element.course == courseId).toList();
  }

  // --------------------Close all boxes--------------------
  // Close all boxes
  Future<void> closeAllBoxes() async {
    await Hive.close();
  }

  // Delete Hive database
  Future<void> deleteHiveDatabase() async {
    try {
      closeAllBoxes();
      var dir = await getApplicationDocumentsDirectory();
      await Directory(dir.path).delete(recursive: true);
    } catch (e) {
      print('Error: $e');
    }
  }
}
