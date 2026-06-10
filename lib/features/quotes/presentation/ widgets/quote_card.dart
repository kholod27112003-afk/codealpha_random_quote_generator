import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/favorites_cubit/favorites_cubit.dart';
import '../../domain/entities/quote.dart';

class QuoteCard extends StatelessWidget {
  final String quote;
  final String author;
  final String id;

  const QuoteCard({
    super.key,
    required this.quote,
    required this.author,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final Quote currentQuote = Quote(
      id: id,
      text: quote,
      author: author,
    );

    return BlocBuilder<FavoritesCubit, dynamic>(
      builder: (context, state) {
        final isFav = state.favorites
            .any((q) => q.id == currentQuote.id);

        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 40,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.format_quote,
                  size: 40,
                  color: Theme.of(context).colorScheme.secondary,
                ),

                const SizedBox(height: 10),

                Text(
                  "“$quote”",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 22),
                ),

                const SizedBox(height: 20),

                Text(
                  author.isNotEmpty ? "- $author" : "",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    // COPY
                    IconButton(
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(text: "$quote\n- $author"),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Quote copied!"),
                          ),
                        );
                      },
                      icon: const Icon(Icons.copy_rounded),
                    ),

                    const SizedBox(width: 15),

                    // SHARE (اختياري)
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.share_rounded),
                    ),

                    const SizedBox(width: 15),

                    // ❤️ FAVORITE
                    IconButton(
                      onPressed: () {
                        context
                            .read<FavoritesCubit>()
                            .toggleFavorite(currentQuote);
                      },
                      icon: Icon(
                        isFav
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: isFav ? Colors.red : Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}