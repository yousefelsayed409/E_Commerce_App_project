import 'package:ecommerceapp/core/helper/dio.dart';
import 'package:ecommerceapp/core/widgets/api_constants.dart';
import 'package:ecommerceapp/featuears/cart/data/models/authentication_request_model.dart';
import 'package:ecommerceapp/featuears/cart/data/models/order_registration_model.dart';
import 'package:ecommerceapp/featuears/cart/data/models/payment_reqeust_model.dart';
import 'package:ecommerceapp/featuears/cart/manger/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentInitialStates());
  static PaymentCubit get(context) => BlocProvider.of(context);
  AuthenticationRequestModel? authTokenModel;
  Future<void> getAuthToken() async {
  emit(PaymentAuthLoadingStates());
  DioHelperPayment.postData(url: ApiContest.getAuthToken, data: {
    'api_key': ApiContest.paymentApiKey,
  }).then((value) {
    authTokenModel = AuthenticationRequestModel.fromJson(value.data);
    ApiContest.paymentFirstToken = authTokenModel!.token;
    print('______________The token ${ApiContest.paymentFirstToken} 🍅');
    emit(PaymentAuthSuccessStates());
  }).catchError((error) {
    print('Error: ${error.toString()}');
    print('Error Data: ${error.response?.data}');
    print('_____________________Error in auth token 🤦‍♂️');
    emit(
      PaymentAuthErrorStates(error.toString()),
    );
  });
}

  Future getOrderRegistrationID({
  required String price,
}) async {
  emit(PaymentOrderIdLoadingStates());
  print('Sending Order ID Request with Price: $price and Token: ${ApiContest.paymentFirstToken}');
  DioHelperPayment.postData(url: ApiContest.getOrderId, data: {
    'auth_token': ApiContest.paymentFirstToken,
    "delivery_needed": "false",
    "amount_cents": price,
    "currency": "EGP",
    "items": [],
  }).then((value) {
    OrderRegistrationModel orderRegistrationModel =
        OrderRegistrationModel.fromJson(value.data);
    ApiContest.paymentOrderId = orderRegistrationModel.id.toString();
    print('________________The order id 🍅 =${ApiContest.paymentOrderId}');
    getPaymentRequest(price);
    emit(PaymentOrderIdSuccessStates());
  }).catchError((error) {
    print('Error: ${error.message}');
    if (error.response != null) {
      print('Status Code: ${error.response?.statusCode}');
      print('Response Data: ${error.response?.data}');
      print('Headers: ${error.response?.headers}');
    } else {
      print('Error without response: ${error.message}');
    }
    print('______________Error in order id 🤦‍♂️');
    emit(
      PaymentOrderIdErrorStates(error.toString()),
    );
  });
}


  // for final request token

  Future<void> getPaymentRequest(
    String priceOrder,
    // String firstName,
    // String lastName,
    // String email,
    // String phone,
  ) async {
    emit(PaymentRequestTokenLoadingStates());
    DioHelperPayment.postData(
      url: ApiContest.getPaymentRequest,
      data: {
        "auth_token": ApiContest.paymentFirstToken,
        "amount_cents": priceOrder,
        "expiration": 3600,
        "order_id": ApiContest.paymentOrderId,
        "billing_data": {
          "apartment": "NA",
          "email": "NA",
          "floor": "NA",
          "first_name": "firstName",
          "street": "NA",
          "building": "NA",
          "phone_number": "phone",
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": "lastName",
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": ApiContest.integrationIdCard,
        "lock_order_when_paid": "false"
      },
    ).then((value) {
      PaymentRequestModel paymentRequestModel =
          PaymentRequestModel.fromJson(value.data);
      ApiContest.finalToken = paymentRequestModel.token;
      print('______________Final token 🚀 ${ApiContest.finalToken}');
      emit(PaymentRequestTokenSuccessStates());
    }).catchError((error) {
      print('_________________Error in final token 🤦‍♂️');
      emit(
        PaymentRequestTokenErrorStates(error.toString()),
      );
    });
  }

  Future getRefCode() async {
    DioHelperPayment.postData(
      url: ApiContest.getRefCode,
      data: {
        "source": {
          "identifier": "AGGREGATOR",
          "subtype": "AGGREGATOR",
        },
        "payment_token": ApiContest.finalToken,
      },
    ).then((value) {
      ApiContest.refCode = value.data['id'].toString();
      print('_______________The ref code 🍅${ApiContest.refCode}');
      emit(PaymentRefCodeSuccessStates());
    }).catchError((error) {
      print("____________Error in ref code 🤦‍♂️");
      emit(PaymentRefCodeErrorStates(error.toString()));
    });
  }
}
