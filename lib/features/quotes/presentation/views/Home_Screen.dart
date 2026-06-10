import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// تأكد من صحة مسارات الملفات لديك
import '../ widgets/glass_quote_card.dart';
import '../cubits/quote_cubit/quote_cubit.dart';
import '../cubits/quote_cubit/quote_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quotes of the Day"),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () => Navigator.pushNamed(context, '/favorites'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // BlocBuilder لمراقبة حالة المقولة (التحميل، النجاح، الخطأ)
            BlocBuilder<QuoteCubit, QuoteState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                // هنا نمرر البيانات للـ QuoteCard ليعرضها
                return QuoteCard(
                  quote: state.quote.isEmpty ? "Press the button to get inspired!" : state.quote,
                  author: state.author.isEmpty ? "" : state.author,
                );
              },
            ),

            const SizedBox(height: 40),

            // زر توليد مقولة جديدة بتصميم عصري ومستقر
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
              // التصحيح هنا: نستدعي الـ Cubit ثم الوظيفة fetchQuote
              onPressed: () {
                context.read<QuoteCubit>().fetchQuote();
              },
              icon: const Icon(Icons.refresh),
              label: const Text(
                "New Quote",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}