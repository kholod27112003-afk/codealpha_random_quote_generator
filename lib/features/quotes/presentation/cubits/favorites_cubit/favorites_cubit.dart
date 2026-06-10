import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/quote.dart';
import '../../../domain/usecases/toggle_favorite.dart';
import '../../../domain/repositories/quote_repository.dart';
import 'favorire_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final QuoteRepository repository;
  final ToggleFavorite toggleFavorite;

  FavoritesCubit({
    required this.repository,
    required this.toggleFavorite,
  }) : super(FavoritesState());

  // تحميل المفضلة
  Future<void> loadFavorites() async {
    emit(state.copyWith(loading: true));

    final favs = await repository.getFavorites();

    emit(state.copyWith(
      favorites: favs,
      loading: false,
    ));
  }

  // إضافة / حذف من المفضلة
  Future<void> toggle(Quote quote) async {
    await toggleFavorite(quote);

    // إعادة تحميل القائمة بعد التغيير
    await loadFavorites();
  }
}