part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {} 

// get carts state //
 class GetCartsSuccessState extends CartState {}
class FailedToGetCartsState extends CartState {}
    
// total price state // 
class GetToTalPricesSuccessState extends CartState {}
 
 // add or remove from cart state // 
class AddOrRemoveItemFromCartsSuccessState extends CartState {}
class FailedAddOrRemoveItemFromCartsState extends CartState {}


