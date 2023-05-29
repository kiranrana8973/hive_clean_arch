class Endpoints {
  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);

  //static String baseUrl = "http://localhost:3000/api/v1/";
  static const String domainUrl = 'http://10.0.2.2:3000/';
  //static const String domainUrl = "http://192.168.4.4:3000/";
  // static const String domainUrl = "http://localhost:3000/";

  static String baseUrl = '${domainUrl}api/v1/';

  // ----------------Student URL----------------
  static const String studentLoginURL = 'student/login';
  static const String studentURL = 'student';
  static const String searchStudentByBatchURL = 'student/searchStudentByBatch/';
  static const String searchStudentByCourseURL =
      'student/searchStudentByCourse/';
  static const String userImageURL = domainUrl;

  // ----------------Batch URL----------------
  static const String batchURL = 'batch';

  // ----------------Course URL----------------
  static const String courseURL = 'course';

  // For storing token or you can store token in shared preferences
  static String token = '';

  Endpoints._();
}
