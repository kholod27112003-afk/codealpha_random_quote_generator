import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // من أجل خاصية النسخ

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // استقبال البيانات الممرة عبر الـ Routing
    // سنفترض أننا نمرر المقولة والكاتب كـ Map أو Object
    final Map<String, dynamic>? args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final String quoteText = args?['quote'] ?? "No quote available";
    final String authorText = args?['author'] ?? "Unknown";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quote Details"),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {
              // منطق المشاركة هنا
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
              // أيقونة ديكورية
              Icon(
                Icons.format_quote_rounded,
                size: 80,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              ),
              const SizedBox(height: 20),

              // نص المقولة (يستخدم الـ Style المستقر من الـ Theme)
              SelectableText(
                quoteText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium,
              ),

              const SizedBox(height: 30),

              // اسم الكاتب
              Text(
                "- $authorText",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),

              const SizedBox(height: 60),

              // أزرار التحكم السفلية
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                    context,
                    icon: Icons.copy_rounded,
                    label: "Copy",
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: quoteText));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Quote copied to clipboard!")),
                      );
                    },
                  ),
                  _buildActionButton(
                    context,
                    icon: Icons.favorite_border_rounded,
                    label: "Favorite",
                    onTap: () {
                      // منطق الإضافة للمفضلة
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

  // Widget مساعد لبناء الأزرار بشكل متناسق
  Widget _buildActionButton(BuildContext context, {required IconData icon, required String label, required VoidCallback onTap}) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            backgroundColor: Theme.of(context).colorScheme.surface,
            foregroundColor: Theme.of(context).colorScheme.primary,
            elevation: 2,
          ),
          child: Icon(icon),
        ),
        const SizedBox(height: 8),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}