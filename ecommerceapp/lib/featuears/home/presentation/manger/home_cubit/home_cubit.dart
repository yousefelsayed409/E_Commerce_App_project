import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/core/helper/Shared/Local_NetWork.dart';
import 'package:ecommerceapp/featuears/categore/data/model/category_model.dart';
import 'package:ecommerceapp/featuears/categore/service.dart';
import 'package:ecommerceapp/featuears/home/data/models/Banners_model.dart';
import 'package:ecommerceapp/featuears/home/data/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<BannerModels> banners = [];  
  List<CategoryModel> categories = []; 
  List<ProductModel> products = []; 
  List<ProductModel> filteredProducts = []; 
  bool isLoading = false; 
  void getBannersData() async {
    emit(GetBannersLoadingState());   try {
      Response response = await http
          .get(Uri.parse("https://student.valuxapps.com/api/banners"));
      final responseBody = jsonDecode(response.body);
      if (responseBody['status'] == true) {
        for (var item in responseBody['data']) {
          banners.add(BannerModels.fromjson(data: item));
        }
        emit(GetBannersSuccessState()); 
      } else {
        emit(FailedToGetBannersState()); }
    } catch (e) {
      emit(FailedToGetBannersState());      
    }
  }

  void getCategories() async {
    emit(GetCategoriesLoadingState());  
    try {
      categories = await CategoryService().fetchCategories();
      emit(GetCategoriesSuccessState());  
    } catch (e) {
      emit(GetCategoriesFailureState(error: e.toString()));  
    }
  }

  void getProducts() async {
    emit(GetProductsLoadingState());  
    try {
      Response response = await http.get(
        Uri.parse('https://student.valuxapps.com/api/home'),
        headers: {
          'Authorization': CashNetwork.getCashData(key: 'token'),
          'lang': "en"
        },
      );
      var responseBody = jsonDecode(response.body);
      if (responseBody['status'] == true) {
        for (var item in responseBody['data']["products"]) {
          products.add(ProductModel.fromJson(data: item));
        }
        emit(GetProductsSuccessState());} else {
        emit(FailedToGetProductsState()); }
    } catch (e) {
      emit(FailedToGetProductsState()); }
  }

  void filterProducts({required String input}) {
    filteredProducts = products
        .where((element) =>
            element.name!.toLowerCase().startsWith(input.toLowerCase()))
        .toList();
    emit(FilterProductsSuccessState()); 
  }
}
