class RegisterState {
  bool isLoading;
  String? error;

  RegisterState({
    required this.isLoading,
    this.error,
  });

  factory RegisterState.initial() {
    return RegisterState(
      isLoading: false,
    );
  }

  RegisterState copyWith({
    bool? isLoading,
    String? error,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
