import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/core/helper/Shared/Local_NetWork.dart';
import 'package:ecommerceapp/featuears/home/data/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

   List<ProductModel> favorites = [];
  // ignore: non_constant_identifier_names
  Set<String> FavoriteId = {};

  Future<void> getfavorite() async {
    emit(GetFavoritesLoadingState());
    favorites.clear();
   http.Response  response = await http.get(
        Uri.parse('https://student.valuxapps.com/api/favorites'),
        headers: {
          'Authorization': CashNetwork.getCashData(key: 'token'),
          'lang': 'en',
        });
    var responsbody = jsonDecode(response.body);
    if (responsbody['status'] == true ) {
      for (var item in responsbody['data']['data']) {
        favorites.add(ProductModel.fromJson(data: item['product']));
        FavoriteId.add(item['product']['id'].toString());
      }
      print("Favorites number is : ${favorites.length}");

      emit(GetFavoritesSuccessState());
    } else {
      emit(FailedToGetFavoritesState());
    }
  }

  void AddOrRemoveFromFavorites({required String productId}) async {
    http.Response response = await http.post(
        Uri.parse('https://student.valuxapps.com/api/favorites'),
        headers: {
          'Authorization': CashNetwork.getCashData(key: 'token'),
          // " lang": ' en',
        },
        body: {
          "product_id": productId
        });
    var responsebody = jsonDecode(response.body);
    if (responsebody['status'] == true) {
      if (FavoriteId.contains(productId) == true) {
        FavoriteId.remove(productId);
      } else {
        FavoriteId.add(productId);
      }
      await getfavorite();
      emit(AddOrRemoveItemFromFavoritesSuccessState());
    } else {
      emit(FailedToAddOrRemoveItemFromFavoritesState());
    }
  }

  
}
