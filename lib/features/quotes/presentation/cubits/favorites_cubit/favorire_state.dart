import '../../../domain/entities/quote.dart';

class FavoritesState {
  final List<Quote> favorites;
  final bool loading;

  FavoritesState({
    this.favorites = const [],
    this.loading = false,
  });

  FavoritesState copyWith({
    List<Quote>? favorites,
    bool? loading,
  }) {
    return FavoritesState(
      favorites: favorites ?? this.favorites,
      loading: loading ?? this.loading,
    );
  }
}