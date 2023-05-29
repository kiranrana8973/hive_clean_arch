import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_clean_arch/features/batch/domain/repository/batch_repository.dart';
import 'package:hive_clean_arch/features/batch/ui/batch_state.dart';

class BatchCubit extends Cubit<BatchState> {
  final BatchRepository _batchRepository;
  BatchCubit(this._batchRepository) : super(BatchState.initial());

  void getAllBatches() async {
    emit(state.copyWith(isLoading: true));
    final data = await _batchRepository.getAllBatches();
    data.fold(
      (l) => emit(state.copyWith(isLoading: false, error: l.error)),
      (r) => emit(state.copyWith(isLoading: false, batches: r)),
    );
  }
}
