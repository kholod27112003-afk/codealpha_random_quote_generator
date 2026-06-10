class QuoteState {
  final String quote;
  final String author;
  final bool isLoading;

  QuoteState({
    required this.quote,
    required this.author,
    required this.isLoading,
  });

  factory QuoteState.initial() {
    return QuoteState(
      quote: '',
      author: '',
      isLoading: false,
    );
  }

  QuoteState copyWith({
    String? quote,
    String? author,
    bool? isLoading,
  }) {
    return QuoteState(
      quote: quote ?? this.quote,
      author: author ?? this.author,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}