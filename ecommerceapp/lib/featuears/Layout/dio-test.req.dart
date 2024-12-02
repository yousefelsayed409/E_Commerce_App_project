// import 'package:dio/dio.dart';
// import 'dart:convert';

// class ApiService {
//   final Dio dio;
//   ApiService({required this.dio});

//   List<BannerModels> banners = [];
//   List<CategoryModels> categories = [];
//   List<ProductModel> products = [];
//   List<ProductModel> filteredProducts = [];
//   List<ProductModel> favorites = [];
//   Set<String> FavoriteId = {};
//   List<ProductModel> carts = [];
//   Set<String> CartsId = {};
//   int totalPrice = 0;

//   UserModel? userModel;

//   Future<void> getUserData() async {
//     emit(GetUserDataLoadingState());
//     try {
//       Response response = await dio.get(
//         "https://student.valuxapps.com/api/profile",
//         options: Options(
//           headers: {'Authorization': Token!, "lang": "en"},
//         ),
//       );

//       var responseData = response.data;

//       if (responseData['status'] == true) {
//         await CashNetwork.insertTocash(
//             key: 'token', value: responseData['data']['token']);

//         userModel = UserModel.fromJson(data: responseData['data']);
//         emit(GetUserDataSuccessState());
//       } else {
//         emit(FailedToGetUserDataState(error: responseData['message']));
//       }
//     } on DioException catch (e) {
//       handleDioExceptions(e);
//       emit(FailedToGetUserDataState(error: e.message));
//     } catch (e) {
//       emit(FailedToGetUserDataState(error: e.toString()));
//     }
//   }

//   void getBannersData() async {
//     try {
//       Response response = await dio.get("https://student.valuxapps.com/api/banners");

//       final responseBody = response.data;

//       if (responseBody['status'] == true) {
//         for (var item in responseBody['data']) {
//           banners.add(BannerModels.fromjson(data: item));
//         }
//         emit(GetBannersSuccessState());
//       } else {
//         emit(FailedToGetBannersState());
//       }
//     } on DioException catch (e) {
//       handleDioExceptions(e);
//       emit(FailedToGetBannersState());
//     } catch (e) {
//       emit(FailedToGetBannersState());
//     }
//   }

//   void getCategoriesData() async {
//     try {
//       Response response = await dio.get(
//         "https://student.valuxapps.com/api/categories",
//         options: Options(headers: {'lang': "en"}),
//       );

//       final responseBody = response.data;

//       if (responseBody['status'] == true) {
//         for (var item in responseBody['data']['data']) {
//           categories.add(CategoryModels.fromjson(data: item));
//         }
//         emit(GetCategoriesSuccessState());
//       } else {
//         emit(FailedToGetCategoriesState());
//       }
//     } on DioException catch (e) {
//       handleDioExceptions(e);
//       emit(FailedToGetCategoriesState());
//     } catch (e) {
//       emit(FailedToGetCategoriesState());
//     }
//   }

//   void getProducts() async {
//     try {
//       Response response = await dio.get(
//         'https://student.valuxapps.com/api/home',
//         options: Options(headers: {'Authorization': Token!, 'lang': "en"}),
//       );

//       var responseBody = response.data;

//       if (responseBody['status'] == true) {
//         for (var item in responseBody['data']["products"]) {
//           products.add(ProductModel.fromJson(data: item));
//         }
//         emit(GetProductsSuccessState());
//       } else {
//         emit(FailedToGetProductsState());
//       }
//     } on DioException catch (e) {
//       handleDioExceptions(e);
//       emit(FailedToGetProductsState());
//     } catch (e) {
//       emit(FailedToGetProductsState());
//     }
//   }

//   void filterProducts({required String input}) {
//     filteredProducts = products
//         .where((element) =>
//             element.name!.toLowerCase().startsWith(input.toLowerCase()))
//         .toList();
//     emit(FilterProductsSuccessState());
//   }

//   Future<void> getfavorite() async {
//     favorites.clear();
//     try {
//       Response response = await dio.get(
//         'https://student.valuxapps.com/api/favorites',
//         options: Options(headers: {'Authorization': Token!, 'lang': 'en'}),
//       );

//       var responseBody = response.data;

//       if (responseBody['status'] == true) {
//         for (var item in responseBody['data']['data']) {
//           favorites.add(ProductModel.fromJson(data: item['product']));
//           FavoriteId.add(item['product']['id'].toString());
//         }
//         print("Favorites number is : ${favorites.length}");

//         emit(GetFavoritesSuccessState());
//       } else {
//         emit(FailedToGetFavoritesState());
//       }
//     } on DioException catch (e) {
//       handleDioExceptions(e);
//       emit(FailedToGetFavoritesState());
//     } catch (e) {
//       emit(FailedToGetFavoritesState());
//     }
//   }

//   void AddOrRemoveFromFavorites({required String productId}) async {
//     try {
//       Response response = await dio.post(
//         'https://student.valuxapps.com/api/favorites',
//         options: Options(headers: {'Authorization': Token!}),
//         data: {"product_id": productId},
//       );

//       var responseBody = response.data;

//       if (responseBody['status'] == true) {
//         if (FavoriteId.contains(productId)) {
//           FavoriteId.remove(productId);
//         } else {
//           FavoriteId.add(productId);
//         }
//         await getfavorite();
//         emit(AddOrRemoveItemFromFavoritesSuccessState());
//       } else {
//         emit(FailedToAddOrRemoveItemFromFavoritesState());
//       }
//     } on DioException catch (e) {
//       handleDioExceptions(e);
//       emit(FailedToAddOrRemoveItemFromFavoritesState());
//     } catch (e) {
//       emit(FailedToAddOrRemoveItemFromFavoritesState());
//     }
//   }

//   Future<void> getCarts() async {
//     carts.clear();
//     CartsId.clear();
//     try {
//       Response response = await dio.get(
//         "https://student.valuxapps.com/api/carts",
//         options: Options(headers: {"Authorization": Token!, "lang": "en"}),
//       );

//       var responseBody = response.data;

//       if (responseBody['status'] == true) {
//         for (var item in responseBody['data']['cart_items']) {
//           CartsId.add(item['product']['id'].toString());
//           carts.add(ProductModel.fromJson(data: item['product']));
//         }
//         totalPrice = responseBody['data']['total'];
//         emit(GetCartsSuccessState());
//       } else {
//         emit(FailedToGetCartsState());
//       }
//     } on DioException catch (e) {
//       handleDioExceptions(e);
//       emit(FailedToGetCartsState());
//     } catch (e) {
//       emit(FailedToGetCartsState());
//     }
//   }

//   Future<bool> addOrRemoveFromCart({required String id}) async {
//     try {
//       Response response = await dio.post(
//         'https://student.valuxapps.com/api/carts',
//         options: Options(headers: {'Authorization': Token!}),
//         data: {'product_id': id},
//       );

//       final responseBody = response.data;

//       if (responseBody['status'] == true) {
//         if (CartsId.contains(id)) {
//           CartsId.remove(id);
//         } else {
//           CartsId.add(id);
//         }
//         await getCarts();
//         emit(AddOrRemoveItemFromCartsSuccessState());
//         return true;
//       } else {
//         emit(FailedAddOrRemoveItemFromCartsState());
//         return false;
//       }
//     } on DioException catch (e) {
//       handleDioExceptions(e);
//       emit(FailedAddOrRemoveItemFromCartsState());
//       return false;
//     } catch (e) {
//       emit(FailedAddOrRemoveItemFromCartsState());
//       return false;
//     }
//   }

//   void changePassword(
//       {required String userCurrentPassword,
//       required String newPassword}) async {
//     emit(ChangePasswordLoadingState());
//     try {
//       Response response = await dio.post(
//         "https://student.valuxapps.com/api/change-password",
//         options: Options(headers: {'lang': 'en', 'Authorization': Token!}),
//         data: {
//           'current_password': userCurrentPassword,
//           'new_password': newPassword,
//         },
//       );

//       var responseDecoded = response.data;

//       if (response.statusCode == 200) {
//         if (responseDecoded['status'] == true) {
//           await CashNetwork.insertTocash(key: 'password', value: newPassword);
//           currenpassword = CashNetwork.getCashData(key: "password");
//           emit(ChangePasswordSuccessState());
//         } else {
//           emit(ChangePasswordWithFailureState(responseDecoded['message']));
//         }
//       } else {
//         emit(ChangePasswordWithFailureState(
//             "something went wrong, try again later"));
//       }
//     } on DioException catch (e) {
//       handleDioExceptions(e);
//       emit(ChangePasswordWithFailureState(e.message));
//     } catch (e) {
//       emit(ChangePasswordWithFailureState(e.toString()));
//     }
//   }

//   Future<void> signUp({
//     required String name,
//     required String email,
//     required String phone,
//     required String password,
//   }) async {
//     emit(SignUpLoadingState());
//     try {
//       Response response = await dio.post(
//         "https://student.valuxapps.com/api/register",
//         options: Options(headers: {'lang': 'en'}),
//         data: {
//           'name': name,
//           'email': email,
//           'phone': phone,
//           'password': password,
//         },
//       );

//       var responseData = response.data;

//       if (responseData['status'] == true) {
//         await CashNetwork.insertTocash(key: "token", value: responseData['data']["token"]);
//         Token = CashNetwork.getCashData(key: "token");
//         emit(SignUpSuccessState());
//       } else {
//         emit(SignUpFailureState(error: responseData['message']));
//       }
//     } on DioException catch (e) {
//       handleDioExceptions(e);
//       emit(SignUpFailureState(error: e.message));
//     } catch (e) {
//       emit(SignUpFailureState(error: e.toString()));
//     }
//   }

//   Future<void> signIn({
//     required String email,
//     required String password,
//   }) async {
//     emit(SignInLoadingState());
//     try {
//       Response response = await dio.post(
//         "https://student.valuxapps.com/api/login",
//         options: Options(headers: {'lang': 'en'}),
//         data: {
//           'email': email,
//           'password': password,
//         },
//       );

//       var responseData = response.data;

//       if (responseData['status'] == true) {
//         await CashNetwork.insertTocash(key: "token", value: responseData['data']["token"]);
//         Token = CashNetwork.getCashData(key: "token");
//         emit(SignInSuccessState());
//       } else {
//         emit(SignInFailureState(error: responseData['message']));
//       }
//     } on DioException catch (e) {
//       handleDioExceptions(e);
//       emit(SignInFailureState(error: e.message));
//     } catch (e) {
//       emit(SignInFailureState(error: e.toString()));
//     }
//   }

//   void handleDioExceptions(DioException e) {
//     if (e.response != null) {
//       print('Dio error: ${e.response?.data}');
//     } else {
//       print('Dio error: $e');
//     }
//   }
// }
