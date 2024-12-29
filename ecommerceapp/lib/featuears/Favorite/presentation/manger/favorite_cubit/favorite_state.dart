part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

// get favotir state // 
class GetFavoritesLoadingState extends FavoriteState {}
class GetFavoritesSuccessState extends FavoriteState {}
class FailedToGetFavoritesState extends FavoriteState {}

// add or remove item favorite state // 
class AddOrRemoveItemFromFavoritesSuccessState extends FavoriteState {}

class FailedToAddOrRemoveItemFromFavoritesState extends FavoriteState {}