import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive_clean_arch/app/error/failure.dart';
import 'package:hive_clean_arch/app/networking/remote/dio_client.dart';
import 'package:hive_clean_arch/features/batch/data/dto/batch_dto.dart';
import 'package:hive_clean_arch/features/batch/data/models/batch_api_model.dart';
import 'package:hive_clean_arch/features/batch/domain/entity/batch_entity.dart';
import 'package:hive_clean_arch/features/batch/domain/repository/batch_repository.dart';

import '../../../../config/constants/api_constant.dart';

class BatchRemoteRepository implements BatchRepository {
  final DioClient _dioClient;
  final BatchApiModel _batchApiModel;

  BatchRemoteRepository(this._dioClient, this._batchApiModel);

  @override
  Future<Either<Failure, bool>> createBatch(BatchEntity batch) {
    // TODO: implement createBatch
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> deleteBatch(String batchId) {
    // TODO: implement deleteBatch
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BatchEntity>>> getAllBatches() async {
    try {
      final response = await _dioClient.dio.get(Endpoints.batchURL);
      BatchDto batchDto = BatchDto.fromJson(response.data);
      return Right(_batchApiModel.toBatchEntities(batchDto.data!));
    } on DioError catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, BatchEntity>> getBatch(String batchId) {
    // TODO: implement getBatch
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> updateBatch(BatchEntity batch) {
    // TODO: implement updateBatch
    throw UnimplementedError();
  }
}
