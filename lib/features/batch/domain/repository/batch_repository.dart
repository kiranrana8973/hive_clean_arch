import 'package:dartz/dartz.dart';
import 'package:hive_clean_arch/app/error/failure.dart';

import '../entity/batch.dart';

abstract class BatchRepository {
  Future<Either<Failure, List<Batch>>> getAllBatches();
  Future<Either<Failure, Batch>> getBatch(String batchId);
  Future<Either<Failure, bool>> createBatch(Batch batch);
  Future<Either<Failure, bool>> updateBatch(Batch batch);
  Future<Either<Failure, bool>> deleteBatch(String batchId);
}
