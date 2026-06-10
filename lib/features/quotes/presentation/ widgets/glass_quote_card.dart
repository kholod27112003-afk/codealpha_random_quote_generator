import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuoteCard extends StatelessWidget {
  final String quote;
  final String author;

  const QuoteCard({
    super.key,
    required this.quote,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 22,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              author.isNotEmpty ? "- $author" : "",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: "$quote \n- $author"));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Quote copied!")),
                    );
                  },
                  icon: const Icon(Icons.copy_rounded),
                  tooltip: "Copy Quote",
                ),
                const SizedBox(width: 15),

                IconButton(
                  onPressed: () {
                  },
                  icon: const Icon(Icons.share_rounded),
                  tooltip: "Share",
                ),
                const SizedBox(width: 15),
                IconButton(
                  onPressed: () {
                  },
                  icon: const Icon(Icons.favorite_outline, color: Colors.red),
                  tooltip: "Add to Favorites",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}