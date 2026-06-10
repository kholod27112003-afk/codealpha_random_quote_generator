import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/AppRouteNames.dart';
import 'core/theme/app_theme.dart';
import 'features/quotes/presentation/views/Home_Screen.dart';
import 'features/quotes/presentation/views/details_screen.dart';
import 'features/quotes/presentation/views/favorites_screen.dart';
import 'features/quotes/presentation/cubits/quote_cubit/quote_cubit.dart';
import 'features/quotes/domain/usecases/get_random_quote.dart';
import 'features/quotes/data/repositories/quote_repository_impl.dart';

void main() {
  runApp(const QuoteApp());
}

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuoteCubit(
        GetRandomQuote(QuoteRepositoryImpl()),
      ),
      child: MaterialApp(
        title: 'Quote Generator',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        initialRoute: AppRouteNames.home,
        routes: {
          AppRouteNames.home: (context) => const HomeScreen(),
          AppRouteNames.favorites: (context) => const FavoritesScreen(),
          AppRouteNames.quoteDetails: (context) => const DetailsScreen(),
        },
      ),
    );
  }
}