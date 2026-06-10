import '../entities/quote.dart';

abstract class QuoteRepository {
  Future<Quote> getRandomQuote();
  Future<List<Quote>> getFavorites();
  Future<void> toggleFavorite(Quote quote);
}