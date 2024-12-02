part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}   

 // get banners state //
class GetBannersLoadingState extends HomeState {}
class GetBannersSuccessState extends HomeState {}
class FailedToGetBannersState extends HomeState {}
    
  // get categories state //
class GetCategoriesLoadingState extends HomeState {}
class GetCategoriesSuccessState extends HomeState {}
class GetCategoriesFailureState extends HomeState {
  final String error;
  GetCategoriesFailureState({required this.error});
}
// get products state // 
class GetProductsLoadingState extends HomeState {}
class GetProductsSuccessState extends HomeState {}
class FailedToGetProductsState extends HomeState {}
 
 // filte product state // 
class FilterProductsSuccessState extends HomeState {}

