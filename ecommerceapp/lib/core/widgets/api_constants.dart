class ApiContest {
  static const String baseUrl = 'https://accept.paymob.com/api';
  static const String paymentApiKey =
      "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1Rjek1UZ3lMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkudW52ZU1UYW1HQmR1OTJiSHhsT0R1RWlwMm8xaXo5MkVBaUNXR2pIWTgtcDNINlhINkJoWHZsRGRZT255c0p0eWxLN2xGamMxNnpvVEh2cnJ3ck92Vnc=";
  static const String getAuthToken = '/auth/tokens';
  static const getOrderId = '/ecommerce/orders';
  static const getPaymentRequest = '/acceptance/payment_keys';
  static const getRefCode = '/acceptance/payments/pay';
  static String visaUrl =
      '$baseUrl/acceptance/iframes/841023?payment_token=$finalToken';
  static String paymentFirstToken = '';

  static String paymentOrderId = '';

  static String finalToken = '';

  static const String integrationIdCard = '4563974';
  static const String integrationIdKiosk = '4564582';

  static String refCode = '';
  static String clientId = "AQDmPCYzBgTzPfEFnldVqBziRICrVFd8aF0gc4fF-4GEDZa15S3xwVDHqJNaXoKTw1b0G6xlCcmrVLt9";
  static String secretKey =  "EO7ouu9r4MtKweblbTRE5sqx_KHoG0sPKzJ466jmQ9q_Tu9uFACL1YjrRtzYGDdFyn-2YXEmcxLkOvGj";
}

class AppImages {
  static const String refCodeImage =
      "https://cdn-icons-png.flaticon.com/128/4090/4090458.png";
  static const String visaImage =
      "https://cdn-icons-png.flaticon.com/128/349/349221.png";
}

abstract class AppConst {
  static const String creatAccount = 'creatAccount';
  static const String onBoardingScreen = 'OnBoardingScreen';
  static const String token = 'token';
 
}
