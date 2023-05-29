import '../domain/entity/batch_entity.dart';

class BatchState {
  final List<BatchEntity> batches;
  final BatchEntity? batch;
  final bool isLoading;
  final String? error;

  BatchState({
    required this.batches,
    this.batch,
    required this.isLoading,
    this.error,
  });

  factory BatchState.initial() {
    return BatchState(
      batches: [],
      isLoading: false,
    );
  }

  BatchState copyWith({
    List<BatchEntity>? batches,
    BatchEntity? batch,
    bool? isLoading,
    String? error,
  }) {
    return BatchState(
      batches: batches ?? this.batches,
      batch: batch ?? this.batch,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
