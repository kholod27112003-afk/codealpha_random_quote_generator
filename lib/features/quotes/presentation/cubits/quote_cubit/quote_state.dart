class QuoteState {
  final String quote;
  final String author;
  final bool isLoading;
  final String? error;

  const QuoteState({
    this.quote = '',
    this.author = '',
    this.isLoading = false,
    this.error,
  });

  QuoteState copyWith({
    String? quote,
    String? author,
    bool? isLoading,
    String? error,
  }) {
    return QuoteState(
      quote: quote ?? this.quote,
      author: author ?? this.author,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}