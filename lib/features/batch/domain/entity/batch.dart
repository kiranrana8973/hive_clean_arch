import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'batch.g.dart';

@HiveType(typeId: 0)
class Batch extends HiveObject {
  @HiveField(0)
  final String batchId;

  @HiveField(1)
  final String batchName;

  Batch({
    String? batchId,
    required this.batchName,
  }) : batchId = batchId ?? const Uuid().v4();

  @override
  String toString() {
    return 'Batch{batchId: $batchId, batchName: $batchName}';
  }
}
