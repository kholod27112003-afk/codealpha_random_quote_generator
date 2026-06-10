import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/quote.dart';
import '../cubits/favorites_cubit/favorite_state.dart';
import '../cubits/favorites_cubit/favorites_cubit.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final String quoteText = args?['quote'] ?? "No quote available";
    final String authorText = args?['author'] ?? "Unknown";

    final Quote quote = Quote(
      text: quoteText,
      author: authorText,
      id: args?['id'] ?? '',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quote Details"),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {
              // مشاركة مستقبلًا
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.format_quote_rounded,
                size: 80,
                color: Theme.of(context)
                    .colorScheme
                    .primary
                    .withOpacity(0.2),
              ),
              const SizedBox(height: 20),

              SelectableText(
                quoteText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium,
              ),

              const SizedBox(height: 30),

              Text(
                "- $authorText",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),

              const SizedBox(height: 60),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                    context,
                    icon: Icons.copy_rounded,
                    label: "Copy",
                    onTap: () {
                      Clipboard.setData(
                        ClipboardData(text: quoteText),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Quote copied to clipboard!"),
                        ),
                      );
                    },
                  ),

                  BlocBuilder<FavoritesCubit, FavoritesState>(
                    builder: (context, state) {
                      final isFav = state.favorites
                          .any((q) => q.id == quote.id);

                      return _buildActionButton(
                        context,
                        icon: isFav
                            ? Icons.favorite
                            : Icons.favorite_border,
                        label: "Favorite",
                        onTap: () {
                          context
                              .read<FavoritesCubit>()
                              .toggleFavorite(quote);
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(
      BuildContext context, {
        required IconData icon,
        required String label,
        required VoidCallback onTap,
      }) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            backgroundColor:
            Theme.of(context).colorScheme.surface,
            foregroundColor:
            Theme.of(context).colorScheme.primary,
            elevation: 2,
          ),
          child: Icon(icon),
        ),
        const SizedBox(height: 8),
        Text(label,
            style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}