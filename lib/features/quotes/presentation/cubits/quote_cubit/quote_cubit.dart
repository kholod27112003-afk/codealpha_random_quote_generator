import 'package:flutter_bloc/flutter_bloc.dart';
import 'quote_state.dart';
import '../../../domain/usecases/get_random_quote.dart';

class QuoteCubit extends Cubit<QuoteState> {
  final GetRandomQuote getRandomQuote;

  // البداية مع الحالة الابتدائية (Initial State)
  QuoteCubit(this.getRandomQuote) : super(QuoteState.initial());

  Future<void> fetchQuote() async {
    // 1. تغيير الحالة إلى "جاري التحميل"
    emit(state.copyWith(isLoading: true));

    try {
      // 2. استدعاء الـ Usecase لجلب المقولة
      final result = await getRandomQuote();

      if (result != null) {
        // 3. النجاح: تحديث الحالة بالمقولة والكاتب
        emit(state.copyWith(
          quote: result.text,    // تأكد أن الـ Entity (Quote) تحتوي على حقل text
          author: result.author,  // تأكد أن الـ Entity (Quote) تحتوي على حقل author
          isLoading: false,
        ));
      } else {
        // حالة عدم وجود بيانات
        emit(state.copyWith(
          isLoading: false,
          quote: "No quote found",
          author: "Unknown",
        ));
      }
    } catch (e) {
      // 4. حالة الخطأ: لضمان استقرار التطبيق وعدم انهياره
      emit(state.copyWith(
        isLoading: false,
        quote: "Something went wrong. Please try again.",
        author: "Error",
      ));
    }
  }
}