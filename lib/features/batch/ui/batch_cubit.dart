import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_clean_arch/features/batch/domain/usecase/batch_usecase.dart';
import 'package:hive_clean_arch/features/batch/ui/batch_state.dart';

class BatchCubit extends Cubit<BatchState> {
  final BatchUseCase _batchUseCase;
  BatchCubit(this._batchUseCase) : super(BatchState.initial());

  void getAllBatches() async {
    emit(state.copyWith(isLoading: true));
    final data = await _batchUseCase.getAllBatches();
    data.fold(
      (l) => emit(state.copyWith(isLoading: false, error: l.error)),
      (r) => emit(state.copyWith(isLoading: false, batches: r)),
    );
  }
}
