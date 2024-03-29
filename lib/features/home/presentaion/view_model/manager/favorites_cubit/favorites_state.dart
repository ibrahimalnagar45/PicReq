part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesDone extends FavoritesState {

  final List<PicCat> images;

  FavoritesDone({required this.images});
}
