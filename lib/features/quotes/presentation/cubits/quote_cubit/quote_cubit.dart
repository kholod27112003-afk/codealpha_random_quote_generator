import 'package:flutter_bloc/flutter_bloc.dart';
import 'quote_state.dart';
import '../../../domain/usecases/get_random_quote.dart';

class QuoteCubit extends Cubit<QuoteState> {
  final GetRandomQuote getRandomQuote;

  QuoteCubit(this.getRandomQuote) : super(const QuoteState());

  Future<void> fetchQuote() async {
    emit(state.copyWith(isLoading: true));

    try {
      final result = await getRandomQuote();

      emit(state.copyWith(
        quote: result.text,
        author: result.author,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: "Something went wrong",
      ));
    }
  }
}