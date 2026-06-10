import '../entities/quote.dart';
import '../repositories/quote_repository.dart';

class GetRandomQuote {
  final QuoteRepository repository;

  GetRandomQuote(this.repository);

  Future<Quote> call() async {
    return await repository.getRandomQuote();
  }
}