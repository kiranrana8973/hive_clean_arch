import 'package:dartz/dartz.dart';
import 'package:hive_clean_arch/app/error/failure.dart';
import 'package:hive_clean_arch/app/networking/local/hive_service.dart';
import 'package:hive_clean_arch/features/batch/data/models/batch_hive_model.dart';
import 'package:hive_clean_arch/features/batch/domain/entity/batch_entity.dart';
import 'package:hive_clean_arch/features/batch/domain/repository/batch_repository.dart';

class BatchLocalRepository implements BatchRepository {
  final HiveService _hiveService;
  final BatchHiveModel _batchHiveModel;

  BatchLocalRepository(this._hiveService, this._batchHiveModel);

  @override
  Future<Either<Failure, bool>> createBatch(BatchEntity batch) async {
    try {
      _hiveService.addBatch(_batchHiveModel.castFromEntity(batch));
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
  Future<Either<Failure, BatchEntity>> getBatch(String batchId) async {
    try {
      final batch = await _hiveService.getBatch(batchId);
      // Convert to entity and return
      return Right(batch.toBatchEntity());
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BatchEntity>>> getAllBatches() async {
    try {
      final batches = await _hiveService.getBatches();

      return Right(_batchHiveModel.toBatchEntities(batches));
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> updateBatch(BatchEntity batch) async {
    try {
      await _hiveService.updateBatch(_batchHiveModel.castFromEntity(batch));
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
