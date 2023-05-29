import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entity/batch_entity.dart';

part 'batch_hive_model.g.dart';

@HiveType(typeId: 0)
class BatchHiveModel {
  @HiveField(0)
  final String batchId;

  @HiveField(1)
  final String batchName;

  BatchHiveModel({
    String? batchId,
    required this.batchName,
  }) : batchId = batchId ?? const Uuid().v4();

  // Create empty HiveBatchModel
  BatchHiveModel.empty()
      : batchId = const Uuid().v4(),
        batchName = '';

  // Convert to BatchEntity from BatchHiveModel
  BatchEntity toBatchEntity() {
    return BatchEntity(
      batchId: batchId,
      batchName: batchName,
    );
  }

  // Convert to List<BatchEntity> from List<BatchHiveModel>
  List<BatchEntity> toBatchEntities(List<BatchHiveModel> batches) {
    return batches.map((batch) => batch.toBatchEntity()).toList();
  }

  // Convert to BatchHiveModel from BatchEntity
  BatchHiveModel castFromEntity(BatchEntity batch) {
    return BatchHiveModel(
      batchId: batch.batchId,
      batchName: batch.batchName,
    );
  }

  @override
  String toString() {
    return 'Batch{batchId: $batchId, batchName: $batchName}';
  }
}
