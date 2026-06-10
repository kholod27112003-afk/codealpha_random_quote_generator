import '../entities/quote.dart';
import '../repositories/quote_repository.dart';

class ToggleFavorite {
  final QuoteRepository repository;

  ToggleFavorite(this.repository);

  Future<void> call(Quote quote) async {
    await repository.toggleFavorite(quote);
  }
}