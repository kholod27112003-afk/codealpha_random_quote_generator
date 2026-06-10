import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CircularProgressIndicator(
          color: AppColors.primary,
        ),
        SizedBox(height: 16),
        Text(
          'Loading Quote...',
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}