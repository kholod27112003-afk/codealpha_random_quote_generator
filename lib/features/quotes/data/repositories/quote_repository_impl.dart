import '../../domain/entities/quote.dart';
import '../../domain/repositories/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  @override
  Future<Quote> getRandomQuote() async {
    return Quote(
      id: '1',
      text: 'Be yourself; everyone else is already taken.',
      author: 'Oscar Wilde',
    );
  }

  @override
  Future<List<Quote>> getFavorites() async {
    return [];
  }

  @override
  Future<void> toggleFavorite(Quote quote) async {
    // local storage later
  }
}