import 'package:dartz/dartz.dart';
import 'package:hive_clean_arch/app/error/failure.dart';
import 'package:hive_clean_arch/features/batch/domain/entity/batch_entity.dart';

abstract class BatchRepository {
  Future<Either<Failure, List<BatchEntity>>> getAllBatches();
  Future<Either<Failure, BatchEntity>> getBatch(String batchId);
  Future<Either<Failure, bool>> createBatch(BatchEntity batch);
  Future<Either<Failure, bool>> updateBatch(BatchEntity batch);
  Future<Either<Failure, bool>> deleteBatch(String batchId);
}
