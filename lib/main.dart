import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/AppRouteNames.dart';
import 'core/theme/app_theme.dart';

import 'features/quotes/data/repositories/quote_repository_impl.dart';
import 'features/quotes/presentation/cubits/quote_cubit/quote_cubit.dart';
import 'features/quotes/presentation/cubits/favorites_cubit/favorites_cubit.dart';

import 'features/quotes/presentation/views/Home_Screen.dart';
import 'features/quotes/presentation/views/details_screen.dart';
import 'features/quotes/presentation/views/favorites_screen.dart';

import 'features/quotes/domain/usecases/get_random_quote.dart';

void main() {
  runApp(const QuoteApp());
}

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = QuoteRepositoryImpl();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => QuoteCubit(GetRandomQuote(repo)),
        ),
        BlocProvider(
          create: (_) => FavoritesCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        initialRoute: AppRouteNames.home,
        routes: {
          AppRouteNames.home: (_) => const HomeScreen(),
          AppRouteNames.favorites: (_) => const FavoritesScreen(),
          AppRouteNames.quoteDetails: (_) => const DetailsScreen(),
        },
      ),
    );
  }
}