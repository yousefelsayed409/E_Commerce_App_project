// import 'dart:convert';
// import 'package:bloc/bloc.dart';
// import 'package:ecommerceapp/featuears/home/data/models/Banners_model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import '../../../home/data/models/Category_model.dart';
// import '../../../home/data/models/product_model.dart';
// import '../../../../core/helper/Shared/Local_NetWork.dart';
// import 'layout_state.dart';

// class LayoutCubit extends Cubit<LayoutStates> {
//   LayoutCubit() : super(LayoutInitialState());

//   // int bottomNavIndex = 0;
//   // List<Widget> layoutScreens = [
//   //   const HomeScreen(),
//   //   const FavoriteScreen(),
//   //   const CartScreen(),

//   //   const ProfileScreen(),
//   // ];
//   // void changeBottomNavIndex({required int index}) {
//   //   bottomNavIndex = index;
//   //   // Emit state
//   //   emit(ChangeBottomNavIndexState());
//   // }

  
//   // List<BannerModels> banners = [];
//   // void getBannersData() async {
//   //   Response response =
//   //       await http.get(Uri.parse("https://student.valuxapps.com/api/banners"));
//   //   final responseBody = jsonDecode(response.body);
//   //   if (responseBody['status'] == true) {
//   //     for (var item in responseBody['data']) {
//   //       banners.add(BannerModels.fromjson(data: item));
//   //     }
//   //     emit(GetBannersSuccessState());
//   //   } else {
//   //     emit(FailedToGetBannersState());
//   //   }
//   // }

//   // List<CategoryModels> categories = [];
//   // void getCategoriesData() async {
//   //   Response response = await http.get(
//   //       Uri.parse("https://student.valuxapps.com/api/categories"),
//   //       headers: {'lang': "en"});
//   //   final responseBody = jsonDecode(response.body);
//   //   if (responseBody['status'] == true) {
//   //     for (var item in responseBody['data']['data']) {
//   //       categories.add(CategoryModels.fromjson(data: item));
//   //     }
//   //     emit(GetCategoriesSuccessState());
//   //   } else {
//   //     emit(FailedToGetCategoriesState());
//   //   }
//   // }
  
//   // get products request //
// //   List<ProductModel> products = [];
// //   void getProducts() async {
// //     Response response = await http.get(
// //         Uri.parse('https://student.valuxapps.com/api/home'),
// //         headers: {'Authorization': CashNetwork.getCashData(key: 'token'), 'lang': "en"});
// //     var responseBody = jsonDecode(response.body);
// //     if (responseBody['status'] == true) {
// //       for (var item in responseBody['data']["products"]) {
// //         products.add(ProductModel.fromJson(data: item));
// //       }
// //       emit(GetProductsSuccessState());
// //     } else {
// //       emit(FailedToGetProductsState());
// //     }
// //   }

// //   // filtered products
// //   List<ProductModel> filteredProducts = [];
// //  void filterProducts({required String input}) {
// //   filteredProducts = products
// //       .where((element) =>
// //           element.name!.toLowerCase().startsWith(input.toLowerCase()))
// //       .toList();
// //   emit(FilterProductsSuccessState());
// // }
//   //Todo ??????,
//   // ??????
//   // !
//   // List<ProductModel> favorites = [];
//   // Set<String> FavoriteId = {};

//   // Future<void> getfavorite() async {
//   //   favorites.clear();
//   //   http.Response response = await http.get(
//   //       Uri.parse('https://student.valuxapps.com/api/favorites'),
//   //       headers: {
//   //         'Authorization': CashNetwork.getCashData(key: 'token'),
//   //         'lang': 'en',
//   //       });
//   //   var responsbody = jsonDecode(response.body);
//   //   if (responsbody['status'] == true ) {
//   //     for (var item in responsbody['data']['data']) {
//   //       favorites.add(ProductModel.fromJson(data: item['product']));
//   //       FavoriteId.add(item['product']['id'].toString());
//   //     }
//   //     print("Favorites number is : ${favorites.length}");

//   //     emit(GetFavoritesSuccessState());
//   //   } else {
//   //     emit(FailedToGetFavoritesState());
//   //   }
//   // }

//   // void AddOrRemoveFromFavorites({required String productId}) async {
//   //   http.Response response = await http.post(
//   //       Uri.parse('https://student.valuxapps.com/api/favorites'),
//   //       headers: {
//   //         'Authorization': CashNetwork.getCashData(key: 'token'),
//   //         // " lang": ' en',
//   //       },
//   //       body: {
//   //         "product_id": productId
//   //       });
//   //   var responsebody = jsonDecode(response.body);
//   //   if (responsebody['status'] == true) {
//   //     if (FavoriteId.contains(productId) == true) {
//   //       FavoriteId.remove(productId);
//   //     } else {
//   //       FavoriteId.add(productId);
//   //     }
//   //     await getfavorite();
//   //     emit(AddOrRemoveItemFromFavoritesSuccessState());
//   //   } else {
//   //     emit(FailedToAddOrRemoveItemFromFavoritesState());
//   //   }
//   // }

  

//     List<ProductModel> carts = [];
//   Set<String> CartsId = {};
//   int totalPrice = 0;

//   Future<void> getCarts() async {
//     carts.clear();
//     Response response = await http.get(
//       Uri.parse("https://student.valuxapps.com/api/carts"),
//       headers: {"Authorization": CashNetwork.getCashData(key: 'token'), "lang": "en"}
//     );
//     var responseBody = jsonDecode(response.body);
//     if (responseBody['status'] == true) {
//       for (var item in responseBody['data']['cart_items']) {
//         // CartsId.add(item['product']['id'].toString());
//         carts.add(ProductModel.fromJson(data: item['product']));
//       }
//       totalPrice = responseBody['data']['total'];
//        debugPrint("Carts length is : ${carts.length}");
//       emit(GetCartsSuccessState());
//     } else {
//       emit(FailedToGetCartsState());
//     }
//   }

//   Future<bool> addOrRemoveFromCart({required String id}) async {
//   try {
//     final response = await http.post(
//       Uri.parse('https://student.valuxapps.com/api/carts'),
//       headers: {'Authorization': CashNetwork.getCashData(key: 'token')},
//       body: {'product_id': id},
//     );
//     final responseBody = jsonDecode(response.body);

//     if (responseBody['status'] == true) {
//       if (CartsId.contains(id)) {
//         CartsId.remove(id);
//       } else {
//         CartsId.add(id);
//       }
//       await getCarts();
//       emit(AddOrRemoveItemFromCartsSuccessState());
//       return true;
//     } else {
//       emit(FailedAddOrRemoveItemFromCartsState());
//       return false;
//     }
//   } catch (e) {
//     emit(FailedAddOrRemoveItemFromCartsState());
//     return false;
//   }
// }


// }
