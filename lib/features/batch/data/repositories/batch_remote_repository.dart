import 'package:dartz/dartz.dart';
import 'package:hive_clean_arch/app/error/failure.dart';
import 'package:hive_clean_arch/app/networking/local/hive_service.dart';
import 'package:hive_clean_arch/features/batch/domain/entity/batch.dart';
import 'package:hive_clean_arch/features/batch/domain/repository/batch_repository.dart';

class BatchRemoteRepository implements BatchRepository {
  final HiveService _hiveService;

  BatchRemoteRepository(this._hiveService);

  @override
  Future<Either<Failure, bool>> createBatch(Batch batch) async {
    try {
      _hiveService.addBatch(batch);
      return const Right(true);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteBatch(int id) async {
    return const Right(true);
  }

  @override
  Future<Either<Failure, Batch>> getBatch(int id) {
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
