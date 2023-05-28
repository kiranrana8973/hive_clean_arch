import 'package:dartz/dartz.dart';
import 'package:hive_clean_arch/app/error/failure.dart';

import '../entity/batch.dart';

abstract class BatchRepository {
  Future<Either<Failure, List<Batch>>> getBatches();
  Future<Either<Failure, Batch>> getBatch(int id);
  Future<Either<Failure, bool>> createBatch(Batch batch);
  Future<Either<Failure, bool>> updateBatch(Batch batch);
  Future<Either<Failure, bool>> deleteBatch(int id);
}
