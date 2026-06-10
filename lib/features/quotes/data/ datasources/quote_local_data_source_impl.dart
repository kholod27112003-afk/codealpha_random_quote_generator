import '../../domain/entities/quote.dart';
import 'quote_local_data_source.dart';

class QuoteLocalDataSourceImpl implements QuoteLocalDataSource {
  final List<Quote> _favorites = [];

  @override
  Future<List<Quote>> getFavorites() async {
    return _favorites;
  }

  @override
  Future<void> saveFavorite(Quote quote) async {
    _favorites.add(quote);
  }

  @override
  Future<void> removeFavorite(String id) async {
    _favorites.removeWhere((q) => q.id == id);
  }
}