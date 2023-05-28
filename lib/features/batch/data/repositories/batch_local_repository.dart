import 'package:dartz/dartz.dart';
import 'package:hive_clean_arch/app/error/failure.dart';
import 'package:hive_clean_arch/app/networking/local/hive_service.dart';
import 'package:hive_clean_arch/features/batch/domain/entity/batch.dart';
import 'package:hive_clean_arch/features/batch/domain/repository/batch_repository.dart';

class BatchLocalRepository implements BatchRepository {
  final HiveService _hiveService;

  BatchLocalRepository(this._hiveService);

  @override
  Future<Either<Failure, bool>> createBatch(Batch batch) async {
    try {
      _hiveService.addBatch(batch);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteBatch(String batchId) async {
    try {
      _hiveService.deleteBatch(batchId);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Batch>> getBatch(String batchId) async {
    try {
      final batch = await _hiveService.getBatch(batchId);
      return Right(batch);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Batch>>> getBatches() async {
    try {
      final batches = await _hiveService.getBatches();
      return Right(batches);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> updateBatch(Batch batch) async {
    try {
      await _hiveService.updateBatch(batch);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
