import '../domain/entity/batch.dart';

class BatchState {
  final List<Batch> batches;
  final Batch? batch;
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
    List<Batch>? batches,
    Batch? batch,
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
