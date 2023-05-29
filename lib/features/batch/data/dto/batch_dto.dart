import 'package:hive_clean_arch/features/batch/data/models/batch_api_model.dart';

// Convert JSON to BatchDto
class BatchDto {
  final bool? success;
  final String? message;
  final List<BatchApiModel>? data;

  BatchDto({
    this.success,
    this.message,
    this.data,
  });

  factory BatchDto.fromJson(Map<String, dynamic> json) => BatchDto(
        success: json['success'],
        message: json['message'],
        data: json['data'] != null
            ? List<BatchApiModel>.from(
                json['data'].map((x) => BatchApiModel.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data != null
            ? List<dynamic>.from(data!.map((x) => x.toJson()))
            : null,
      };
}
