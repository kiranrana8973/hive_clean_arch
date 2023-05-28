import 'package:dartz/dartz.dart';
import 'package:hive_clean_arch/app/error/failure.dart';
import 'package:hive_clean_arch/features/batch/domain/entity/batch.dart';
import 'package:hive_clean_arch/features/batch/domain/repository/batch_repository.dart';

class BatchRemoteRepository implements BatchRepository {
  @override
  Future<Either<Failure, bool>> createBatch(Batch batch) {
    // TODO: implement createBatch
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> deleteBatch(String batchId) {
    // TODO: implement deleteBatch
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Batch>> getBatch(String batchId) {
    // TODO: implement getBatch
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Batch>>> getBatches() {
    // TODO: implement getBatches
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> updateBatch(Batch batch) {
    // TODO: implement updateBatch
    throw UnimplementedError();
  }
}
