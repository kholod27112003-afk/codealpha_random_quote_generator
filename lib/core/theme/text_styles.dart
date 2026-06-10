import 'package:flutter/material.dart';

class AppTextStyles {
  // عنوان التطبيق في الـ AppBar
  static const TextStyle appBarTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
  );

  // نص المقولة الكبير
  static const TextStyle quoteText = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    height: 1.4,
    fontStyle: FontStyle.italic,
  );

  // اسم الكاتب
  static const TextStyle authorText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );

  // نصوص الأزرار
  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  // عناوين الأقسام (مثل "المفضلة")
  static const TextStyle sectionTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  // النصوص العادية
  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
}