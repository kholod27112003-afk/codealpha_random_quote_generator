import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../ widgets/quote_card.dart';
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
            onPressed: () =>
                Navigator.pushNamed(context, '/favorites'),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<QuoteCubit, QuoteState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state.quote.isEmpty) {
                  return  QuoteCard(
                    id: "${state.quote}-${state.author}",
                    quote: state.quote,
                    author: state.author,
                  );
                }

                return QuoteCard(
                  id: "${state.quote}-${state.author}",
                  quote: state.quote,
                  author: state.author,
                );
              },
            ),

            const SizedBox(height: 40),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                    horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
              onPressed: () {
                context.read<QuoteCubit>().fetchQuote();
              },
              icon: const Icon(Icons.refresh),
              label: const Text(
                "New Quote",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}