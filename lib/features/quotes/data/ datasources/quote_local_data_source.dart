import '../../domain/entities/quote.dart';

abstract class QuoteLocalDataSource {
  Future<List<Quote>> getFavorites();
  Future<void> saveFavorite(Quote quote);
  Future<void> removeFavorite(String id);
}