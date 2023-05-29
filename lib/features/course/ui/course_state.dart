import '../domain/entity/course.dart';

class CourseState {
  final List<CourseEntity> courses;
  final bool isLoading;
  final String? error;

  CourseState({
    required this.courses,
    required this.isLoading,
    this.error,
  });

  factory CourseState.initial() {
    return CourseState(
      courses: [],
      isLoading: false,
    );
  }

  CourseState copyWith({
    List<CourseEntity>? courses,
    bool? isLoading,
    String? error,
  }) {
    return CourseState(
      courses: courses ?? this.courses,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
