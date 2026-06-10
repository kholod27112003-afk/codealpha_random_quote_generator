import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/quote.dart';
import 'favorite_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState());

  void toggleFavorite(Quote quote) {
    final updated = List<Quote>.from(state.favorites);

    final exists = updated.any((q) => q.id == quote.id);

    if (exists) {
      updated.removeWhere((q) => q.id == quote.id);
    } else {
      updated.add(quote);
    }

    emit(state.copyWith(favorites: updated));
  }

  void removeFavorite(Quote quote) {
    final updated = List<Quote>.from(state.favorites);

    updated.removeWhere((q) => q.id == quote.id);

    emit(state.copyWith(favorites: updated));
  }
}