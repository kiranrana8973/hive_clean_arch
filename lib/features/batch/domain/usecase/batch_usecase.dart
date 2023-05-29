import 'package:dartz/dartz.dart';

import '../../../../app/error/failure.dart';
import '../entity/batch_entity.dart';
import '../repository/batch_repository.dart';

class BatchUseCase {
  final BatchRepository _batchRepository;

  BatchUseCase(this._batchRepository);

  Future<Either<Failure, bool>> createBatch(BatchEntity batch) async {
    return await _batchRepository.createBatch(batch);
  }

  Future<Either<Failure, bool>> deleteBatch(String batchId) async {
    return await _batchRepository.deleteBatch(batchId);
  }

  Future<Either<Failure, BatchEntity>> getBatch(String batchId) async {
    return await _batchRepository.getBatch(batchId);
  }

  Future<Either<Failure, List<BatchEntity>>> getAllBatches() async {
    return await _batchRepository.getAllBatches();
  }

  Future<Either<Failure, bool>> updateBatch(BatchEntity batch) async {
    return await _batchRepository.updateBatch(batch);
  }
}
