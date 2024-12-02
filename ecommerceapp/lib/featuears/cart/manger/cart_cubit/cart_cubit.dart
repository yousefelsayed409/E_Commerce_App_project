import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/core/helper/Shared/Local_NetWork.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../../home/data/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

   List<ProductModel> carts = [];
  Set<String> CartsId = {};
  int totalPrice = 0;
   

   // get carts request // 
  Future<void> getCarts() async {
    carts.clear();
  http.Response  response = await http.get(
      Uri.parse("https://student.valuxapps.com/api/carts"),
      headers: {"Authorization": CashNetwork.getCashData(key: 'token'), "lang": "en"}
    );
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == true) {
      for (var item in responseBody['data']['cart_items']) {
        // CartsId.add(item['product']['id'].toString());
        carts.add(ProductModel.fromJson(data: item['product']));
      }
      totalPrice = responseBody['data']['total'];
      emit(GetToTalPricesSuccessState());
       debugPrint("Carts length is : ${carts.length}");
      emit(GetCartsSuccessState());
    } else {
      emit(FailedToGetCartsState());
    }
  }
   
    // add or remove from carts request // 

  Future<bool> addOrRemoveFromCart({required String id}) async {
  try {
    final response = await http.post(
      Uri.parse('https://student.valuxapps.com/api/carts'),
      headers: {'Authorization': CashNetwork.getCashData(key: 'token')},
      body: {'product_id': id},
    );
    final responseBody = jsonDecode(response.body);

    if (responseBody['status'] == true) {
      if (CartsId.contains(id)) {
        CartsId.remove(id);
      } else {
        CartsId.add(id);
      }
      await getCarts();
      emit(AddOrRemoveItemFromCartsSuccessState());
      return true;
    } else {
      emit(FailedAddOrRemoveItemFromCartsState());
      return false;
    }
  } catch (e) {
    emit(FailedAddOrRemoveItemFromCartsState());
    return false;
  }
}
}
