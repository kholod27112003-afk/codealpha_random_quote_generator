import 'dart:math';
import '../../domain/entities/quote.dart';
import '../../domain/repositories/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final List<Quote> _quotes = [
    Quote(
      id: '1',
      text: 'Be yourself; everyone else is already taken.',
      author: 'Oscar Wilde',
    ),
    Quote(
      id: '2',
      text: 'The best way to get started is to quit talking and begin doing.',
      author: 'Walt Disney',
    ),
    Quote(
      id: '3',
      text: 'Don’t let yesterday take up too much of today.',
      author: 'Will Rogers',
    ),
    Quote(
      id: '4',
      text: 'It’s not whether you get knocked down, it’s whether you get up.',
      author: 'Vince Lombardi',
    ),
    Quote(
      id: '5',
      text: 'If you are working on something exciting, it will keep you motivated.',
      author: 'Steve Jobs',
    ),
    Quote(
      id: '6',
      text: 'Success is not in what you have, but who you are.',
      author: 'Bo Bennett',
    ),
  ];

  final List<Quote> _favorites = [];

  @override
  Future<Quote> getRandomQuote() async {
    final random = Random();
    return _quotes[random.nextInt(_quotes.length)];
  }

  @override
  Future<List<Quote>> getFavorites() async {
    return _favorites;
  }

  @override
  Future<void> toggleFavorite(Quote quote) async {
    final exists = _favorites.any((q) => q.id == quote.id);

    if (exists) {
      _favorites.removeWhere((q) => q.id == quote.id);
    } else {
      _favorites.add(quote);
    }
  }
}